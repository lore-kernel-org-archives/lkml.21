Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795415926;
	b=BtrpOHGGeyxB0BpPIfaozQbFiTvLQdJ9XvWPOxpAYXUBGHO1lEQ73s5bMFguBsXB2aW+
	 wBkQZ2As6bBJ0u1Kpvvi/afpehPZGC3Gyo3YreQhaKN3m7MVeyRXeA7I8KqIeRoXo4rjf
	 iDR5TLRTwpRGLFNO3YkYiEjKorDmWG0HJOZ09QKUcC0TOKTc1DS/HswHvQT5r5Qbxy6l2
	 Mxqtjl52rTLukOZi6Jz6YxC6Yu89p2svdbR4wnesdykHPZex33JWTQnUI/xnwHs1k4Ebv
	 qFJ8skpDudowYnJIIBfMbEQLdgjt6TLM0BaBC6wgleqylhQjAUdcH3YIBPBh6HpXalQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NVD2K+hzT//oEG10ivggwaDCvEUpG9RqeSyqEh6apek=;
	b=2hrDzoLNNPp6omLUF5ny+F5n93zCq+sUORMp5cDUleHKF5N48eNserTvfSHjbzmXuhka
	 CntqXzTsT+2VbtrgDdWZsZN+E3ABzG+mY83AxMkakNtB9veBZmqPwrA62VuaPZA4hShiL
	 u5k1TNM6d5JGHLAJyLR+e3+HlW1zHVOhWgIaEZBVq3JIGiYvEFc9HUsNH/Pyl0lJKB9TF
	 tZz4IpdyjMjPIUiR59Xcx0BPl+koaWG6tYqBP2Cx8e3w7il4O2KzFOXzBmvWjb1cxXza5
	 GDRcftkOMwLekV24nQYcNny+RH8LtbGeOmj3Pe7/geVBQzDGVBECLdLlqH2+FH1qpuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fkksMU8f;
	arc=none smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F69606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3F69606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fkksMU8f
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5ee36376a0dso1719828e0c.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795415925; x=1796020725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NVD2K+hzT//oEG10ivggwaDCvEUpG9RqeSyqEh6apek=;
        b=fkksMU8fAc+yqUoyWh6UZIACw679gqlS/C06qNo/BJOrb9yO8zMFLP3pH6lSr8OzEr
         8NQanRaXVIszQU54moh8JIFe6/3kSi5GMNopXMQqXEHMf8Y7i2b2R+Z6/jerAFUa7Ewq
         IHRSMgjWg1dolorsttwxt/7zbcqS5zuMd3mhUXqFwd6UltrEaQg4nksxtVqSwdpgJ5GK
         Z5e9IywPqwuKLHVUJw2kpJ/TpQVpQuz+CSopnYGsNaT1K2QRpxb78rJDeSgeqkRXp+0C
         JjSIISsdV6zTFT737bPIfU9+sur19yUaIGYoI64FkVi5StEZ1nSV7JfG57+7kctH+9od
         Cflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795415925; x=1796020725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NVD2K+hzT//oEG10ivggwaDCvEUpG9RqeSyqEh6apek=;
        b=I6Pd3FtqkOt7R2jPaIolFxwKchmLdMWQmYpMLpaiOi29b7Mh+e4vANOYiNOReUR+DX
         9Sc+j43X7VYAxm0IgH12wN9NYHBLvj2Edg43JyaBWIdZgxRacg1AQko4fLjydJnciJW3
         lfm79BeEEwDz5F2WUwmmtdAdLZ3BLOAnRZrD3uZCdG8KQKSNvJeouKdz818YDTpOdnzR
         b3d0TiXzEuNaTq2D/w4mHez7oTOmCJ7UzSM4ZFRgItAqO3SkQKLUko0Urqre1hs1xA17
         vH7l+OnTonsYeCSuk2WycqxeDFDbAY12Nscsc1CGO9BWP0BfUHv4Rd/h6i25LsEI2M0B
         18ow==
X-Forwarded-Encrypted: i=1; AL+hErHwMAH7t3UEFjGyohWMVsNdL8rLkCSkwhmtAemvqzm6wiz+h/iARHEpMrsOi7aXQjD6lo1xJPpDNkb3m6c=@vger.kernel.org
X-Gm-Message-State: APuU4Z88YBfqLR4OgooWT5swptpg7UJ5mRMEqLVwdn/UL6gIV+XjL/7W
	bW45ETiNXxkd+q4utU3aEmFAd58E6hWamt8fXkXJGiOsJIvnsG8BMAdc
X-Gm-Gg: AZFdTZcHtXju35a4lNn1mJ2Cuadm+3pD+yOYdDFikUW+w+6Bnro8diRJ0Kya3f2D2BT
	29hdMyDm0nSJSNG3VYduyUriVz45/VK4XTkAoBK1Dm7EtdLKV+q0AfIo4ABS51BihcFzGb/KTT8
	gfx2QOiZztzOrFZ3gR+ivR7qLwnrYUHQRKAic52Ff7GZjXRM+uphEstqyIjC8UkjRU9iN416MMs
	UO0JPlbPG1nTTL5KtZ/rn3BLk7XFwuoKS2bAz7iv+7REc8oIQ171iTAPpF2/gzb568C7rc4dAj/
	+6dDsHxadgLzw6xvhW+U/ZOHDmNg0e3jexIVGV5GSalD9+Y+M/GzToBUhQAHUSjnFIZc/LTyCkq
	OxW50+83ke1vSjxoNPwW3Yi/nmWksETkLxf80xfB1oWaiBvi/EeabbroOKYlzp2wb49W2/R8C7g
	w2ylg6qCUGv7V0OAhzJ/N3i9QJm/X0hKeW7aVl2sxXleEPvHxnhxpXC/aIo8ismrqKt7OXbixzC
	gZcCk+/JimnF/VdPaei3T6+LMKYLpcLY8rIE9JNpih3DKS5rDspseGvspvV695bxGc2tGd+Ehbq
	zc4qBRhqVZjewAms03ch6Ts3kJwUGIQp3C915Ry5dqXp5NegBBcYrFutUjrw00yVezhESS4+cPW
	AOsjneV8wEMbi
X-Received: by 2002:a05:6122:1d0c:b0:5ea:b991:d489 with SMTP id 71dfb90a1353d-5ee8aed6f75mr5307099e0c.13.1795415924871;
        Sun, 22 Nov 2026 22:38:44 -0800 (PST)
Received: from MacBook-Air-91.lan ([2603:9000:d440:53a:10be:9c04:cd21:d4ba])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b4335e1sm9994665e0c.1.2026.11.22.22.38.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 22:38:43 -0800 (PST)
From: Juan Agustin Niccolini <juanagusnicco@gmail.com>
To: netdev@vger.kernel.org
Cc: John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sabrina Dubroca <sd@queasysnail.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Alexei Starovoitov <ast@kernel.org>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	linux-kernel@vger.kernel.org,
	Juan Agustin Niccolini <juanagusnicco@gmail.com>,
	Eddy Tsalolikhin <eddsterxyz@gmail.com>,
	Kyle Zeng <kylebot@openai.com>
Subject: [PATCH net] tls: set the copy cursor before cloning plaintext
Date: Mon, 23 Nov 2026 01:38:42 -0500
Message-ID: <20261123063842.64536-1-juanagusnicco@gmail.com>
X-Mailer: git-send-email 2.53.0
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

tls_sw_sendmsg_locked() copies into the open record by cloning space
with tls_clone_plaintext_msg() and filling it with
sk_msg_memcopy_from_iter(), which starts at sg.curr and sg.copybreak
as left by whatever last added to the record. The copy trusts other
paths to leave that cursor in the right state, and they have not.

Since commit d829e9c4112b ("tls: convert to generic sk_msg interface"),
the path that adds the caller's own pages (sendpage, later splice) did
not move sg.curr, so the next copy wrote into those pages. Commit
c5a595000e26 ("net: tls, update curr on splice as well") fixed that by
making the splice path leave sg.curr at sg.end with copybreak 0. That
is only correct if the clone adds a new element. sk_msg_clone() instead
grows the last element when the cloned range is contiguous with it, so
sg.end does not move, and the copy starts at an unused slot, wraps
around the ring and writes from sg.start, into the spliced pages again.

The spliced pages can be page cache pages of a file the caller opened
read-only, so an unprivileged user can change the cached contents of a
file it cannot write.

The copy path always appends after the data already in the record, so
set the cursor there before cloning: on the last element with copybreak
at its length, or at sg.start when the record is empty, as
sk_msg_reset_curr() does. That holds whether the clone grows the last
element or adds a new one, and it covers every path that adds to the
record, whatever state it left the cursor in.

This is where the cursor should have been set all along. With it set
here, the copy never depended on the splice path moving sg.curr, so
neither the original bug nor the one introduced by its fix would
have existed.

I found this bug during an LLM-based audit. Kyle Zeng and Eddy
Tsalolikhin independently reported it before and are credited below.

Fixes: d829e9c4112b ("tls: convert to generic sk_msg interface")
Fixes: c5a595000e26 ("net: tls, update curr on splice as well")
Reported-by: Eddy Tsalolikhin <eddsterxyz@gmail.com>
Reported-by: Kyle Zeng <kylebot@openai.com>
Closes: https://lore.kernel.org/all/20261030042138.73739-1-kylebot@openai.com/
Cc: stable@vger.kernel.org
Signed-off-by: Juan Agustin Niccolini <juanagusnicco@gmail.com>
---
Jiayuan Chen posted "[PATCH net v1] tls: fix ring wrap in
sk_msg_memcopy_from_iter() after splice"
(https://lore.kernel.org/all/20261120225720.89044-1-jiayuan.chen@linux.dev/),
which sets the same cursor in the splice path. The two patches touch
different functions and apply in either order, and this one is still
needed even if his goes in: his closes the splice route on mainline,
but not tls_sw_do_sendpage() on 6.1, 5.15 and 5.10, where it does not
apply, nor the record split on 7.1 and older. This patch removes the
copy's dependence on all of them, and applies unchanged to every
stable branch, because tls_clone_plaintext_msg() is the same everywhere.

I have an exploit that lets an unprivileged process overwrite the page
cache of /bin/su to open a root shell. I confirmed it works on mainline
and 5 distros. It is available to the maintainers on request.

On 6.1, 5.15 and 5.10 the bug is a race, but an unprivileged user
won it within a second in my tests. I have another reproducer
available for those.

I used a fuzzer with a page cache oracle to confirm this patch fixes
the issue in QEMU guests on mainline 7e1392a42ea2, and all stable branches:
7.3.5, 7.1.13, 6.18.64, 6.12.118, 6.6.162, 6.1.192, 5.15.225, and 5.10.274.

I also confirmed that it fixes the original bug on a kernel
without c5a595000e26 applied.

 net/tls/tls_sw.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 226e0f176fdc..efff7a02aef2 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -349,6 +349,17 @@ static int tls_clone_plaintext_msg(struct sock *sk, int required)
 	 */
 	skip = prot->prepend_size + msg_pl->sg.size;
 
+	if (msg_pl->sg.size) {
+		u32 i = msg_pl->sg.end;
+
+		sk_msg_iter_var_prev(i);
+		msg_pl->sg.curr = i;
+		msg_pl->sg.copybreak = msg_pl->sg.data[i].length;
+	} else {
+		msg_pl->sg.curr = msg_pl->sg.start;
+		msg_pl->sg.copybreak = 0;
+	}
+
 	return sk_msg_clone(sk, msg_pl, msg_en, skip, len);
 }
 

base-commit: af6737b9066832a2017c281159950ba92385ce00
--
2.53.0

