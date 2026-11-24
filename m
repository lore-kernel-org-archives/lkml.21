Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560672;
	b=bnJNsVEH7bEsAhXpuXH2tbr8QAZdlWOUG+LOZK8373nMfk9/xqt+FIad5FKmquTX4SY/
	 Va5GjZjonu1jBL5Vybn3dQ1Bg893xXVtGLLwne//PVLw2AYxPExHsfcvNx+WtoGg1eQmE
	 tRMyacVDMU0PN544ZLTQb2DIE+8V+JwBY5jvQwrNI7dJP0bw0220CvZGVDvwAL7g8Ko2i
	 zbPb06rzOmsxKHY3StDKBP7SAp93DbXtrakx74q6d0iXGVLOqzRa1IklJOcN/0gsHU4ic
	 Aae2lAdGsp7RIDPBKlDJWRD+EUKT6Y0Y9/u961sQm36GA65ZqtGjmAFAdZ/JDBRufuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=liov99GJPDwRp7LfHV3OU/QCtwG0K/vL8qG58IkGVsE=;
	b=u4QqHoPG+75jFj0bx32j3W+0O6mlQK56Hse2y326bHPdzVwO+t3h5ZPaCGZPwnyKmnYo
	 cnTMnGa8ZO8uzDWwIU2BAd/NKjgwDuGiOPsEJql7Os+SVu8DmCX5qRTho9H00JQcg1rQm
	 sDrZWWMlbxwd+YKqbonGjPeTY5F8Xxtnt0PzJZiiqjgDLoBEO3JEGZHkTpzQkiJyNyeZ8
	 +4xXh3czg2dGezAH2Fx/fblL2FqA7rUiAMAg34azFJ66yHd900RULlOLdI33IKH0UEKy+
	 K9kIKw8O1cijB09gTkrwkUN6Dgzd+My2Uq11oG/v8kHCB5MtnfTl8lPlwrDfpqWKInw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c7CCnyK8;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9C8606A331
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB9C8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c7CCnyK8
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so47007715e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795560670; x=1796165470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=liov99GJPDwRp7LfHV3OU/QCtwG0K/vL8qG58IkGVsE=;
        b=c7CCnyK8URyZ9d10mCgzJpitaKd/+AjqVzwHrg5k51Vx9aWB+J/Ux9cNLFtfPYcnbQ
         Gid+Ipfb+j/Wp5m2fAgCoGN6OPnVS+N3Ft7w1GeZ/zICiIMte/cRknVcxiuoMMQ4dpqE
         i1iDRNZsV9jVs5BbJJaq1mcTuZ/3K1jGXIe+v2agmaiFiDCGhTNqRzKRr14MkTdTBJ3r
         l+n5Ip1fcds/4evknI73/99/exlvJiOV1O/GfJQ+MqsQ09CkSO51OmKGyXW21k7EOw2Q
         j6T8Zk29kZaV9y591HUMDnQUD+jJDdry9jfzSW8SLM6LrNHQDnZ9gweXI3h4YPJMpzKv
         a/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560670; x=1796165470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=liov99GJPDwRp7LfHV3OU/QCtwG0K/vL8qG58IkGVsE=;
        b=RxwP/PQuVhyScsjVTZKoLJFNFthXF7zvM5Fx1hjeIDobrbjWCpyydkbSu3It7LEY9y
         ZIsz53dO/HpVexx4yMUbcVonIvrtKjZgUWZKCiUG+7NxHZa1/HUQpjZJ2hUSF5s0uPEu
         v3d8ii7nEHA18g8ndFddMn/kXbX0EyD1vqEb/bCjckJop+j2jQZASdKSCFMQBQGfLtNM
         xEyGCgkZKW10QjZHaSXNzxJHrR1MRjt3x2cgeCj5leYIZrMUaJnv35n9JhcB1Kt9qXYb
         +rE7KpkiTQHBCGdtpPTSEgmZuP6rB8vytC3HmSVMyVxOp3rCXFl7jrhT8ZrsgwC1Sc05
         yv7g==
X-Forwarded-Encrypted: i=1; AL+hErFVg7OZGS1YFpAgC3BPM3jPjdoVGb4I3RGHeGhypnC61bIfzv8M8MHk3a+2/LrCPZU5CGbJARDciCJlC50=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kjz2dPLfflVelyNtOfXZAOA0xivD+hCYKGSGi9G1D4AvOgvjs
	8OSZI9kVYJJyTxg/0QN64IJ30lN/MzbCyaMsbrGbzhQpUbMurAgmkWA=
X-Gm-Gg: AZFdTZfK2bLuDQBNk3ZuoRazOdaopmETIv4coaEFbqXWC5FH+MR084z9fHTnJ7vGnu5
	d9kZN4fODzu2L/AytNYu9dd+G9vzPpiHe5HSwQq3zvZ8ggyakDUJ7f8FYZaLeigIS7RBxf+zLWo
	ICQgQv9/ekLvEuSTtuPw3BSLN/QYP/H3lQpKKM+PiXFAbabVgtBBdQ9GoNA5X4MpzxVxVf5bo1p
	BpaGVXjhVVbYZ12rLIyqg0wW+ZJBdyve+BwKrRto6sTKupi7xQ1UxJVoOePJu6j9LOk0XZdeJZH
	Kv9OGIeipykbdTsOAIaCRA6s3O/7ieQxXoykjjdj+6ANS7FxslPTWJlsuFqwGxyXLoJI33MmV+K
	ys5qaLJaRNbAnWBrNOuGM9COS4OlZUUJvThE1tpYrmSjd7rEJy8eKDjwVTAY+yYSgYDXqWFazI6
	fx6nH4f9GmGx/UXTB99C9v7HgX1KZ7nOOp5FNbtkv9v7/qq37pefHBowhPyLZCikMNFECODObLf
	S375pjbhn4aEjDHr8GkUgzdaewYXFdNSLsTMY3zXtgAW2FdQsjGOFJSpvITTaC8jkqk8TOc6h6P
	wshE5mUxdXlB16i44xgRZH5BmhCY1WPWNyiCrIceU1bqrLu57IZ89Mpq2EPjktEZ5uMjzFGDSiC
	7ok6c/d0cQ4MMWn18XHqSblSjAb6WI/ZIRR/oAf62RTlL8ISzjE6OQ+vIHI3wc6D8ShfSsopRuC
	yf3/VQy5FuiGJstxWS0vFgkNX14dB2TznM
X-Received: by 2002:a05:600c:8b11:b0:4a1:df52:3e36 with SMTP id 5b1f17b1804b1-4bb8881d194mr335283135e9.27.1795560670058;
        Tue, 24 Nov 2026 14:51:10 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-2ec1-8a00-a10d-4335-1e05-e7ae.310.pool.telefonica.de. [2a02:3100:2ec1:8a00:a10d:4335:1e05:e7ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm393839525e9.9.2026.11.24.14.51.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 14:51:09 -0800 (PST)
From: Tobias Philipp <tphilipp@gmail.com>
To: bpf@vger.kernel.org
Cc: Tobias Philipp <tphilipp@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Thibaut=20VAR=C3=88NE?= <hacks@slashdirt.org>,
	Stijn Tintel <stijn@linux-ipv6.be>,
	Daniel Mack <daniel@zonque.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v2 3/4] bpf: Align devmap values to 8 bytes
Date: Tue, 24 Nov 2026 23:50:54 +0100
Message-ID: <20261124225055.87344-4-tphilipp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124225055.87344-1-tphilipp@gmail.com>
References: <20261124225055.87344-1-tphilipp@gmail.com>
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

dev_map_lookup_elem() and dev_map_hash_lookup_elem() return &obj->val
as the map value. In struct bpf_dtab_netdev, val follows
"unsigned int idx" and is at offset 52 on 64-bit and 28 on 32-bit
architectures, so it is only 4-byte aligned.

devmap is read-only for BPF programs, but the verifier assumes that map
values are 8-byte aligned and accepts a 64-bit load-acquire at offset 0
of a struct bpf_devmap_val value on 64-bit architectures. The arm64 JIT
emits LDAR for it, which raises an alignment fault on a misaligned
address. FEAT_LSE2 does not change that, because Linux does not set
SCTLR_EL1.nAA. The fault is not fixed up.

Mark val as __aligned(8). On 64-bit it moves to offset 56 and the size
of struct bpf_dtab_netdev stays 64 bytes. On 32-bit the verifier
rejects 64-bit load-acquire, so the misaligned value is harmless there.
Aligning it anyway keeps all map values 8-byte aligned and grows the
struct from 36 to 40 bytes. Entries are allocated with kmalloc, which
provides at least 8-byte alignment.

This patch was written with the help of an AI coding assistant
(Claude Opus 5.5).

Fixes: 880442305a39 ("bpf: Introduce load-acquire and store-release instructions")
Signed-off-by: Tobias Philipp <tphilipp@gmail.com>
---
 kernel/bpf/devmap.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/devmap.c b/kernel/bpf/devmap.c
index 1b8f0d7f8..0ef24e3f9 100644
--- a/kernel/bpf/devmap.c
+++ b/kernel/bpf/devmap.c
@@ -70,7 +70,10 @@ struct bpf_dtab_netdev {
 	struct bpf_prog *xdp_prog;
 	struct rcu_head rcu;
 	unsigned int idx;
-	struct bpf_devmap_val val;
+	/* Returned to BPF programs as the map value, which the verifier
+	 * assumes to be 8-byte aligned.
+	 */
+	struct bpf_devmap_val val __aligned(8);
 };
 
 struct bpf_dtab {
-- 
2.54.0 (Apple Git-157)

