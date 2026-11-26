Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722240;
	b=kcrXB+3QnNYSAopEUTVvu5eVBlbiAsjTyb54skV/GoxCmcgzwtlUfe39ohGM5OtmkMU7
	 vXTjLr6TFAV900Gyuzn+arwDbGr3NyBfhe74n1lCOP0I8yjTy4hfUEOEWlWnX5fEhgQyj
	 uhxFREPeUHOyCHeNPOn4KxeXpoBKu8Fla2VkyWq6dtKxPW1L+cMqzAVFExT9QFWZtccKt
	 YGoR4NDix2NaVnedaHVbYb6kXUrPM9c36lT9M5rFG5S6mxJef8vrp5vPbTBOMR5c0ByLc
	 gvEWojonEU1AQdNDKCGxrrLFjvv+/ClV2b30ZIHaZYUR1nhuaQvblo15H512IGLj9NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cTlGczEpqnTOct8RsrZ/gODErZ8owqpFldUbfmAHspI=;
	b=3svsUGS/exyeD4aRgSmqCXmU1oVuaaNWE4zeFFZe0AVUBuCgfy2+rcPSe8q3LBCq1SMK
	 s7Sybf5vKdcHWdD5UXqXxlbkboLOSlw84621XpoVjNSPI5hpzMFeXHGg6ENTsFbJYiFex
	 U4ORkAqgCXU+fER//SzaJC5oynzfzxVnbz0rC/o2gZ5MIjGJQAK5PDM0Zd7Dstu/iL3yN
	 7MUqnK8cEDYh8AXLNGYCqPH/A1XWSJvti46bFxpTQDWa2iiHiRUx/HwfXZffuTSvFMgxJ
	 wpHDrXaeyrJYpzQOfUrEUzsbn9/0So3l4mFlaSRy/FNFSCOOd8RRNURcbO26+bJislg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="D/RCqXQS";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B54606A6A5
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1B54606A6A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D/RCqXQS
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-49412eb1474so4831321f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795722238; x=1796327038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cTlGczEpqnTOct8RsrZ/gODErZ8owqpFldUbfmAHspI=;
        b=D/RCqXQS4UeN6v20Z+VlBVJK/ZZX/cCGhIw/ilwIJBaJwk1qthCZOB7Hg/2I7i+4b3
         gXFQ4bI37t5xPPDFsxIZCp3undzL8liJl1dhk9x26M+SkiFQiV+7Vrud1K9saTD8x0sH
         UQMiTIPG1dCkfQb0PxR6z9D5p8o7O1YzP64p0tMKDD4z4PSjcjwQijNF5MccAC+MyA1q
         gLfW5lTkUooix1E3K7bTU9lw8/aq1xp6zPR8L2TbturBUIa7a3UOJhiI/2hrCU8Srmvz
         xoxkVJVoMSNteiXv1w98CN7QNYMr+TYloJe8vE9eCeJR5FzLV7xl1p9CdamhuhxKADyZ
         bRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722238; x=1796327038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cTlGczEpqnTOct8RsrZ/gODErZ8owqpFldUbfmAHspI=;
        b=y4BbQ6hqYwRecUJ0PvGxIMUbSfTAtH8dP47Y6zpMSbxLCeofEkFrY9+Fy7H3YhRwIk
         PEFS2EBrQiOIlfTMRqgfmSQvtEj7kEWyGhyYUQcbGFawnBaH8LriQXcKRyazXCaVMG9o
         Nu4pHhIPwH9hclI/1TQTrQpfff5Yu2W+pBf35nJiBglXlHRuL/RkisECwAEOZjAuU0Ky
         g1LfNftwIDbDQh8RsVHk+KZ93el1UufwSKuZgpkGdiXllvLvjclW1GLgSkl30vGnVci8
         ZfrwC2nn4U0KX81l167bWDkdpmRjJiqNVGMTvWdsGVprGwGeMw1Jvo/oxCtI5J1uDatn
         Yo0Q==
X-Forwarded-Encrypted: i=1; AL+hErELh/s/oCdcBz4yQA9roaRqblvkJIDVtjCFAetBCc4nWHx2MXqisfHCma++8FRgPcuJug7HqQ2MdeLRWQk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bxAefvwHfkkUpwn7E9O/sI4PQj9JsAYD6z/UDmyAcDKOsYy+G
	tQzsYJLcIv0wzZKLd3oe+Xs24R38SiNfW+ek3dP57WT2ItHAMeAvvl0=
X-Gm-Gg: AZFdTZdiDwm8yNEjn6iHDZ4YYOMPw/tg+QnPW5EAvXf/+KrfaTKm7uWeSYxEHuh93B0
	4FZ0G22xBdCy6ULiap98iXZaXA4zBz9/PX9bji/rmryky3tPnViMXabLPcbA0LwwsGhy06qDfUn
	HdHqe5NjsbOC8B8HtdFV3SOQqBaAjGaaybnI8Hc42V8fiFWXrO+UaaRvl4yHuI7nvJcX+QX+owP
	vVX3LqM037OYaZGbrDV2ilcfArRht0wsQqEtX0F5UnrAcMe3XCbiZS19521zLE1DzkJf1QGCFvQ
	UBh2KdnDhvnPhLquxhBRRCnlGInsqph5lcm1LoNm7kK9hyRUr1leSf0O9aAVIcnBQ+dAeUM5YNX
	zA3AiCAsY/QTbqeH3+l2uY0lUGDfFwUgVcHr5za+e3d6POQ9aZ16xyAmayT8Cl6w/otS+iZTdRx
	HaBedmmjCMtfPNF4ZdDCaBeGSMqEC2/fnYmY18aDrvGbQzku5jmmlPfZA5jHEJJr+1KHH9VPtri
	9F7iIHg6imCQ2yIfVyB0RZQH5z8tYmaoVOTcrDZc70YGt9i0DcBTzvWXZU/CBrS577K+5dK45IC
	ekDh/u4jgvPCMku+tTebL5K0HEfAncnJ4h4zbwLQ7Jl9Lagw1aU6n8/Y3MYxA1CPhKF3oMkAAlS
	hH5B9VrYi2qNrer7cAR6BjK430daFQQQXKPGl7pMigR0je0tOHBaImcynu4fFM1MRZF5eahboJO
	M7R0Zepls1RdWaNjMMVoNRsrmf/qfObQfG
X-Received: by 2002:a05:6000:25c2:b0:4a6:7781:b064 with SMTP id ffacd0b85a97d-4abb51457e8mr54433934f8f.31.1795722237966;
        Thu, 26 Nov 2026 11:43:57 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-2317-a900-4811-d431-309f-6626.310.pool.telefonica.de. [2a02:3100:2317:a900:4811:d431:309f:6626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm43663924f8f.3.2026.11.26.11.43.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 11:43:57 -0800 (PST)
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
Subject: [PATCH bpf-next v3 3/4] bpf: Align devmap values to 8 bytes
Date: Thu, 26 Nov 2026 20:43:46 +0100
Message-ID: <20261126194347.42466-4-tphilipp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261126194347.42466-1-tphilipp@gmail.com>
References: <20261126194347.42466-1-tphilipp@gmail.com>
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
emits LDAR for it, which raises an alignment fault on CPUs without
FEAT_LSE2. The fault is not fixed up.

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
 kernel/bpf/devmap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/devmap.c b/kernel/bpf/devmap.c
index 1b8f0d7f8..c92aa81e4 100644
--- a/kernel/bpf/devmap.c
+++ b/kernel/bpf/devmap.c
@@ -70,7 +70,8 @@ struct bpf_dtab_netdev {
 	struct bpf_prog *xdp_prog;
 	struct rcu_head rcu;
 	unsigned int idx;
-	struct bpf_devmap_val val;
+	/* The verifier assumes that map values are 8-byte aligned */
+	struct bpf_devmap_val val __aligned(8);
 };
 
 struct bpf_dtab {
-- 
2.54.0 (Apple Git-157)

