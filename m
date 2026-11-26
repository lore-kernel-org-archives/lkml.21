Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711343;
	b=OyX6ulKn3DghEScNnngIJyBjsCaqxrrx8fSR0gn4M1kio3MNN8bXC4KxBzt57chtCRUM
	 L29I92JpqotEbmK8/qX71vQ54wsSHTkBFJFa49mStHphCd+VyvpLMat7Q097JgoC5XJaY
	 0X/KKT3trsYfDISJUOaKbZDVXA714L3SEO7arlU5SvEAItvZc8ZPDf82X9U/xSbNg0NFF
	 a0mJ5WmbOOEMIHvYU7XrnA0iX1FyiV7KcUtWU7bmQ8on0zEDuDnjsTMubQifF7K8AIyCz
	 1ru2F5A3j0pruoCcbEc9CYOAti7fAT7qUTRZXeHNblpqM7PYYZYoosgDm9HJLPKeU0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vYLe6Aye6cjPeLVGkLhVr6tiV642wkKY+G+lAL+UdWQ=;
	b=igqPR0pGi5n7kq5zlsBdaPtMYuZxhQ44rjKUogAY80D4s9weD322HsxYggBP7nKMs6Ea
	 rvM0YZSk3gr9dGWjy/dhlrSyu/GQNzGRWnA55YeTDkqX+cBwwnZ5UCynsWYZhJQ5ntQKE
	 IEdsiTx2B2W2PsXKPgwyhW/LMqHuWSKuAi+dn25oxjjKM11tb7EQpnjOamYz/aRZFy+t7
	 HAERtWKwCnSS+VKwbGKmSpMEvTfx2L2Onj7YU8CW8wN0qhIQR7hp544g3XOCxr0TONpht
	 ehRZrafejDZfnRKXTyuT6HIzZlmCsbIHSq+bLnomE+VQrPpTwpICVw7W25r8Z1pKlPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ItlsisZg;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8964060A3831
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8964060A3831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ItlsisZg
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-386bd881d39so7313220eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795711342; x=1796316142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vYLe6Aye6cjPeLVGkLhVr6tiV642wkKY+G+lAL+UdWQ=;
        b=ItlsisZgBsbLBK1VgS9ZB0PlWxT8mDUjm48+mrCX79lYJPOQ8c8rj5gbKOZZyF8KFM
         jVOKBW8PN0sYgzM7Wi03VpnArAY4AZH2Xk9NawKQQH//EEk9tKpTuORygFksVccHbxci
         MpeFeEYhAGypWCr/SmSEyOp+iyiJwNygswDunFOFPW/DSLJy1YzIqaNxtflbATlqzVK0
         sLtqS6AM+InztaTEtkj2pUySpHkWJVyp6EcXfTLb6cYjzuY1qViGLXM1rT4LAdJpw3s6
         5sxHptkWlX/8QJwLFOkHyesTb7NZ8DoceMB9axxcXNBHubMq129Y0H45vlCxabz05NI3
         cUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711342; x=1796316142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vYLe6Aye6cjPeLVGkLhVr6tiV642wkKY+G+lAL+UdWQ=;
        b=Z1ni9G0hYtk7PiWAm2W9mbiH+VihRpyF09QKBFG+aRTkPTXgTN4GilUyXtJeFYpyvb
         37DTaL1g15UsmmUyaA+CZbFl3ydiIoaAmFje2TLlKDfnmPH+CKeDaGdYjG29EQdxP1Dr
         KvLxvt/8mK8rpptiTOt8PJKS6OHVJ4MPfy9c6JTKwcJpVdtsp4r+pbrUpCX3kA+h5iCi
         Xx8shNLl/ugpuz1LzYzRcsADvNmFt8jiaLQw/Faq6+8VAJwR4zjUiUchPEeQ78HLcBkO
         VKbdPKpu1DXjgcN4wkYgtPStteO4PU0Gc1szCwkeKC2euloZL6D9RvNFgGm15y0P/BAG
         jbuQ==
X-Forwarded-Encrypted: i=1; AL+hErEup2iKk6Xt8ND9cmH+c6wQt+3cZHVbOB2NPKiBuxzEorEkrPnlMW9HXTDWCDTsLC0/jHNcFD4nIf9MHx8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ySWkMtBL9Hav02yVjHt7UdWjECD+SHhbB/aEJKpWu/ufUV8Gr
	ZHEEJmlOItOV12Q28ezLp3WcKrMF9EfZ5CMDmirbbvpWvWZdroUvWnaJ
X-Gm-Gg: AZFdTZcicxqNBgFR9Gx0VsYFcm6iQFHY4M8p6rRuI56spcIl/Du7G/wbO8gDd8ln/mM
	kTlZhXcaEJZLNnuoRegRkPoB9iq1NRe9nyVqQdCJuFiNqDUpZSmG291OK/nOhRQ6MxBItWkRD0f
	e79FAiza9+3rMgp3qn2kbXHVuhhn0wif6dZyLcFcydwYpKmx8Dra0u8bwS3BHpSSAVbnf8Hxlwg
	VgcPQ2nJipQ2mEPk2FwtH6BtVPm2JkmlAmax+7vVAuRBvHlphMc3UEuSQUk7jvZZW8FV3MhIm6Z
	ONMzfx71pGcbIiDu+iU/7RFn6t3NSvcvIEC0R04NpVdh69CfkqliAcIEVXa7qC510l/zoI4py/s
	1erXKhrELScroiLofbY9sGFvOKCstXrid/SBGL+4Ovus4Hr0jwQlF0J79fYcfsWQwYpjviDekev
	aZjlKDSbtf+jfgkgU3OB6nozdWVkW/4lAW3xbYsMygkRaLeLD+UWOp05jLgAWw9LP4z3EeJUuZr
	ouB+/2xq7f3TJWk0zXWghwThP7nq2CK3TAIarSd4N6kB5ubrrWvQ2Pz+RiPyRgWqscQPvXSfJp/
	LXxRUyDyNR10bZ2nFKGDWqCnbyZM
X-Received: by 2002:a05:7300:c3aa:b0:385:c28b:a4d5 with SMTP id 5a478bee46e88-385c28baffbmr22699614eec.17.1795711341575;
        Thu, 26 Nov 2026 08:42:21 -0800 (PST)
Received: from ubuntu.. ([2405:201:8026:213e:d3fe:57ef:a814:ecbc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm66709770eec.28.2026.11.26.08.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:42:21 -0800 (PST)
From: mdshahid03@gmail.com
To: netdev@vger.kernel.org
Cc: edumazet@kernel.org,
	ncardwell@google.com,
	kuniyu@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	willemb@google.com,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH net v2] tcp: fix division by zero in tcp_cong_avoid_ai()
Date: Thu, 26 Nov 2026 22:11:50 +0530
Message-ID: <20261126164150.8838-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Mohammad Shahid <mdshahid03@gmail.com>

The tcp_cong_avoid_ai() function divides tp->snd_cwnd_cnt by
the argument w without checking whether w is zero.

Since w is an unsigned value, the condition tp->snd_cwnd_cnt
>= w does not prevent division by zero when w is zero.

The function is also exposed as BPF kfunc through the bpf-tcp-cc
allowlist. The BPF verifier does not enforce a nonzero value for
this argument.

Return early when w is zero to prevent division by zero.

Fixes: e78aea8b2170 ("bpf: tcp: Put some tcp cong functions in allowlist for bpf-tcp-cc")
Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 net/ipv4/tcp_cong.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/ipv4/tcp_cong.c b/net/ipv4/tcp_cong.c
index 8e83ef81fc18..f70f49b4b1e7 100644
--- a/net/ipv4/tcp_cong.c
+++ b/net/ipv4/tcp_cong.c
@@ -469,6 +469,9 @@ EXPORT_SYMBOL_GPL(tcp_slow_start);
  */
 __bpf_kfunc void tcp_cong_avoid_ai(struct tcp_sock *tp, u32 w, u32 acked)
 {
+	if (unlikely(!w))
+		return;
+
 	/* If credits accumulated at a higher w, apply them gently now. */
 	if (tp->snd_cwnd_cnt >= w) {
 		tp->snd_cwnd_cnt = 0;
-- 
2.43.0

