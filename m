Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795257421;
	b=Kw2PMDBuzgQga1WKRnDVHvFZ/i/oP0+99QbSaskneeMvj8ysF/tV/0fCzg3lE+ARlMC9
	 aNdZpSsN14M49ia+Pyx3vBV6ABVni3l91jFhm40JwUe5pQ50f2OoC0ud8tj2bYh2c20OK
	 zBFFMhOlnx9kwjIGxza+7f/MmCWVLbFCv3WDnO/kDMrtCj3ft/G0oI+HvNOOw0LMP97Du
	 r560Zd9eKB793ve4mgtyvLJi4VdxZLQu44SItyZBj8cc7JvYzGilqyVJVAXiVkovk1Wr/
	 Xv+NVWsc29kSZDrtGYdsltEJTt3R/etCNlSBAQTmc6qgE4d4Bz7qsrKz0qcsR5PYgXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795257421;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fVafo7VVGOAxU7xppUD22xBkgF56cPIMm8sSKGz3KtE=;
	b=mxxlHy4AJuu59BAWHfrT28PnQGGhksY0p61VzLb6dDqnLac6B10JMckNPuN0d/UlP2kd
	 xGpbbcvaV3VMc7j5l82GUudVeGl5mWIjjttH2b7ITHWNPu7Q7BVhlyZ6KBmRv5IfpRvoQ
	 XQI51F5Rtl5ZxZ7hfauf6lRZNAh/3VND197sWZPS//0XfhUmM6DdJeUIhpd/miagAuzf5
	 PipmyfWGGalUatztLpxzV8oAMh44MHAMnXsO87MaSYF4M6BuxO0UHYaZRNejIeQhQ2Cjm
	 7HhG4C5PRZSgA3p4Q+U9dZMWGBs4SGY5h8nnMdNErL7oI+cqzVN55z2piBvSdUx8wCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="sRoH/BXB";
	arc=none smtp.remote-ip=91.218.175.47
Received: from mta0.migadu.com (out-47.mta0.migadu.com [91.218.175.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A817606A325
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A817606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sRoH/BXB
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Dh7M6YJjkXymTwAnjqzCtNUHOOr/CM690rfac9vffno=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795257419; v=1; x=1795862219;
 b=sRoH/BXBJQtDmlXqIe5iHh9CoD0BstGHepwOhz3gbkGjtyqd02U22THBXWmPBf2D2Fab/nfM
 Y+bQL55Flq8ZBzbSarCDPdBhs9BCMjIyNvCDqxjK8PTkf8Aw18wlC1ErRKOYJsMrNY42vkAJg4r
 2K0IjLi5ulL1UYK/h1EOnEis=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d6b425b91883e4b8;
	Sat, 21 Nov 2026 10:36:59 +0000
X-Mizu-Trace-ID: d6b425b91883e4b8
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: bpf@vger.kernel.org,
	ast@kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Sechang Lim <rhkrqnwk98@gmail.com>,
	Michal Luczaj <mhal@rbox.co>,
	Mattia Meleleo <mattia.meleleo@coralogix.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf 10/11] selftests/bpf: Fix errno expected by the wait send mem test of test_sockmap
Date: Sat, 21 Nov 2026 18:30:11 +0800
Message-ID: <20261121103222.88209-11-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121103222.88209-1-jiayuan.chen@linux.dev>
References: <20261121103222.88209-1-jiayuan.chen@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test closes the redirect target while the sender waits for its send
memory. A part of the data has gone out, so sendmsg() returns that part
and the test calls sendmsg() again.

With apply_bytes, the previous patch keeps the verdict for the bytes that
were not sent. The next sendmsg() sends to the same target and returns
-EPIPE, instead of running the prog again, which no longer finds the
target in the map and returns SK_DROP, -EACCES.

Accept -EPIPE as well.

Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 tools/testing/selftests/bpf/test_sockmap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/test_sockmap.c b/tools/testing/selftests/bpf/test_sockmap.c
index aaf2050e88450..771146268df77 100644
--- a/tools/testing/selftests/bpf/test_sockmap.c
+++ b/tools/testing/selftests/bpf/test_sockmap.c
@@ -566,7 +566,8 @@ static int msg_loop(int fd, int iov_count, int iov_length, int cnt,
 			sent = sendmsg(fd, &msg, flags);
 
 			if (!drop && sent < 0) {
-				if (opt->tx_wait_mem && errno == EACCES) {
+				if (opt->tx_wait_mem &&
+				    (errno == EACCES || errno == EPIPE)) {
 					errno = 0;
 					goto out_errno;
 				}
-- 
2.43.0

