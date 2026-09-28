// オフライン状態かを判定してデータをローカル保存するユーティリティ
const VolleyOffline = {
  // データをスマホ内に保存
  saveData: function(key, data) {
    try {
      const existing = this.getData(key) || [];
      existing.push({ data: data, timestamp: new Date().toISOString() });
      localStorage.setItem('volley_' + key, JSON.stringify(existing));
      console.log('データをローカルに保存しました:', key);
      return true;
    } catch (e) {
      console.error('ローカル保存エラー:', e);
      return false;
    }
  },

  // スマホからデータを取り出す
  getData: function(key) {
    const item = localStorage.getItem('volley_' + key);
    return item ? JSON.parse(item) : [];
  },

  // ネットワーク接続状態の監視
  isOnline: function() {
    return navigator.onLine;
  }
};

// オンライン復帰時に通知を出すイベントリスナー
window.addEventListener('online', () => {
  console.log('インターネット接続が復旧しました。未送信データを同期できます。');
});
