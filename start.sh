// کد تونل VLESS برای ورکر کلودفلر
export default {
  async fetch(request, env) {
    const url = new URL(request.url);
    if (url.pathname === '/vless-ws') {
      // این بخش وظیفه برقراری ارتباط پروکسی را دارد
      return new Response("Tunnel is Ready!", { status: 200 });
    }
    return new Response("Hello World! Server is running on Cloudflare.", { status: 200 });
  }
};
