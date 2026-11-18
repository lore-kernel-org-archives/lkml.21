Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018603;
	b=mPa6x/2GTVfF1RF4zfqUB31Q6XRNbejUJ8HE4DZuXdC01YQ7+UJgCVIgujt1EH+rL6Sp
	 y1sXSVnRZSSYV7m+K0ybcBDz2fkB17NMhkmmBcpASKOhkwdE8udA0MJRa1oVhey1Ilhyo
	 KJXXoMJhrBXuAjkWzjjTGhL7RVEvBCuHy4k/ah6coxZjuLN0M6fsoABY05VKFNmfHzAXG
	 Nb/s6GQ0hvjALumRDBLL0XtKCPO8w08jipxHxpV2PHcVcLP0kqZ+8my3eCyts67g7UW7h
	 tmx6CQ5eM1Gd8cqVKs47Fjo+Wtzzty1srDES1I+M0apn2PaZI8z0qnk8cRW+4g7rPrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+hDJ59DAiZ9oaoQ4Kn0wejktfUDrr5uda88bBbLHEsg=;
	b=YIZ7BLdoeMu7eRz5/3vWrjlUvtFI+KSvb2HsAE66/IdIme/Zdf9ADp4HcCZVGCswFQNW
	 XeerDK3yQcjOoOmOH5RjLCKdSOqRbRMd6W42tvua/L+m+7zDniPWwJOtG6x+VzOsTBEAP
	 wqJqiaJEAH2t66IfkgGz4Dlx3x2IJqXH5Qljctic3L54qE8EZEFRiwPovP1AUM5+Q1vhL
	 E5JOLDow7cerLwSxCIPHgtjGfdPHkhJaZ5cx1pwwhI7lmOdLhqHSznHUGY+otnwjNfTR4
	 iAW4QiFXqg1r5IZ6E0A8M/5BFlBFVvmskOj+C5q1sqEs2h/ZeZY6BcrDjkooefgxs+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ccxItMpV;
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F611606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F611606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ccxItMpV
Received: by mail-pj2-f3.google.com with SMTP id 98e67ed59e1d1-3ada6c66964so222096a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795018602; x=1795623402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+hDJ59DAiZ9oaoQ4Kn0wejktfUDrr5uda88bBbLHEsg=;
        b=ccxItMpV0dtW5594Xn7TJbW87gSKf4IvHD9fjpkuHCHYo8sZ/oVnH4fgzRiCpDDbrV
         /qu2j6GRtqKMMYYSVqZgLlnwtnE+hO9y3ml5GKeMO98wh3avt47mhDK/7ukjdRhAo+qg
         TiEwsEiLIzhHrzksmEUFCSShU4FPRZw1Gr6NNwIf9oZfrSp/6znwyk+yMTqemulec254
         FGyuIfPUopBor+IUXqEWzuhNjfBro1d43eQCqesDB2lwxGw4HwMDy1dI0b3AOlk0nnoS
         ysF9iGijvW/kquY0gJ4vSMxDPvH++EQo498pEwftCrC6Eu1mS+drpV7+DM9P4tY9b1q6
         M/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018602; x=1795623402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+hDJ59DAiZ9oaoQ4Kn0wejktfUDrr5uda88bBbLHEsg=;
        b=QhwXC57PdvFyVVOdWSKkV5yEbMAUfpCc5usXF3+iWEgmYQ9noo50930ZA12VygoxEV
         Dw+c3YC4kPtq74rrHf++R7KgfF8c3nEmpwB87iLT/B7/YEaEzUdbVzWI+omSMETgLBLr
         kWGRUj1/6q9fnclF4A6D7ORnsZjcQV7+qM+jcMj62kB1AnELVZGlIg3pDDnvPnuAvO2s
         tlNSigV+q9MmLVsHlcXKA9lMyvAQJY2jTYLNMa/i57rrPalUc1S+rEmzde6b+vc+ctnY
         fjt2QFrfznzYkeDvaaZoTqgxZUeNMuVxlZZqoI246fiEsVbwEXis9ojzpldmb/EswCS+
         Je6Q==
X-Forwarded-Encrypted: i=1; AL+hErGnnWSfApAN7mMYjb2IqQr+AXcJsYDXbuaXnHbtATSm1OfdRMZI/M2dUzePOUyu7XViEBYYvyApJ8VljfQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NhK1GgXBsn6BWDLDtVJ9GzIgxvwgVZBGZmMmb7xt32kKY2ZQJ
	9HLLGzdiGW4YcCCLiAK1odOLa19g1xTKvEKpSl4GfqGE3aD1CPi2eWSp
X-Gm-Gg: AZFdTZd4z/q9JVbtFpu24F7/FeQFyy0xXueLrwuVYPG1jOdWME8eLi91BoEIxYz0E+c
	WChdXG3BdUaefB5B5RJmqH3/yBxabeH3+dz7IUVKISvPnX4qKYvHJz2y7PwEyDAiPDNDb5C7raa
	xecRgugOk93X/BIm2W4aDllE6//+JRtUu1zDVy8D0oYVBb2iPTiznu9Wvtj1VPE/h00FVefwqJo
	jEzd13J0TqkKy9VcaLWJLd1UckjDaYszV4EueSADRkMhjnjYC3ekFErcXhjZR79KQ8DtQWOeAMc
	yGBzedqhkYIitvsbChsE/0KNGYkCSBRz+P6gUvq9FB4fvZZJj7dhf05FJ3jVQsGNkDcU91nDSS5
	ue/D1gDeEbQEmsttnCDZNcs81/4Pwq5JXgpEcWUX1vCUcBoxZZ9bgM/TXjBC7Z0cbgDuuTVQrK1
	POz4124JYKhEeM/ohKOyHbTjDKxzhpsgGgLt0CDyCavqqS8tqMkybFHjCzsUc6whM1n5IPRfSHt
	jZtdAL6RaOzH7lnVo01W8I8aIzT8gRXfGkh7CRkDNiZPvRSiOO/uGbptdZWPIExlmJTYAMTuKjV
	/OZmnsoAX1dz8vqSZsu9pyhvhr7MENy4Inf5wbKOOtZsYm0=
X-Received: by 2002:a17:90b:5390:b0:3ab:2d17:51c5 with SMTP id 98e67ed59e1d1-3b3d0640f3bmr3428395a91.6.1795018601880;
        Wed, 18 Nov 2026 08:16:41 -0800 (PST)
Received: from J4f-Laptop.localdomain ([183.36.237.113])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde533658e4sm256978a12.2.2026.11.18.08.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:16:41 -0800 (PST)
From: Shihuang Liu <shlomojune6@gmail.com>
To: bpf@vger.kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	kuba@kernel.org,
	qmo@kernel.org,
	Shihuang Liu <shlomojune6@gmail.com>
Subject: [PATCH bpf-next v2 1/2] bpf: Reject offloaded maps as map-in-map inner maps
Date: Thu, 19 Nov 2026 00:16:31 +0800
Message-ID: <20261118161632.177820-1-shlomojune6@gmail.com>
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

Offloaded ARRAY/HASH maps share map_type with the software maps but use
bpf_map_offload_ops and a different object layout.  bpf_map_meta_equal()
compares map_type, key/value size, flags and the btf record only, so an
offloaded map can be inserted into an outer map created from a software
template.  The verifier and JIT then use the software layout on the
offloaded object: an ARRAY lookup writes to bpf_offloaded_map.dev_priv
and a HASH lookup reads bpf_htab fields past the 320-byte allocation.
An offloaded map used as inner_map_fd is accepted too and leads to a
NULL map_lookup_elem call.

Drop map_meta_equal from bpf_map_offload_ops so the existing check
rejects offloaded templates, and compare ops in bpf_map_meta_equal() so
an offloaded candidate no longer matches a software template.

Fixes: a38845729ea398 ("bpf: offload: add map offload infrastructure")
Link: https://lore.kernel.org/all/20261112105620.57520-1-shlomojune6@gmail.com/
Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>
---
 kernel/bpf/map_in_map.c | 7 ++++---
 kernel/bpf/syscall.c    | 1 -
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/bpf/map_in_map.c b/kernel/bpf/map_in_map.c
index 0fa3f2ac0f992f..9ec3bbfb5d4e3c 100644
--- a/kernel/bpf/map_in_map.c
+++ b/kernel/bpf/map_in_map.c
@@ -38,6 +38,7 @@ struct bpf_map *bpf_map_meta_alloc(int inner_map_ufd)
 	if (!inner_map_meta)
 		return ERR_PTR(-ENOMEM);
 
+	inner_map_meta->ops = inner_map->ops;
 	inner_map_meta->map_type = inner_map->map_type;
 	inner_map_meta->key_size = inner_map->key_size;
 	inner_map_meta->value_size = inner_map->value_size;
@@ -65,7 +66,6 @@ struct bpf_map *bpf_map_meta_alloc(int inner_map_ufd)
 	}
 
 	/* Misc members not needed in bpf_map_meta_equal() check. */
-	inner_map_meta->ops = inner_map->ops;
 	if (inner_map->ops == &array_map_ops || inner_map->ops == &percpu_array_map_ops) {
 		struct bpf_array *inner_array_meta =
 			container_of(inner_map_meta, struct bpf_array, map);
@@ -88,8 +88,9 @@ void bpf_map_meta_free(struct bpf_map *map_meta)
 bool bpf_map_meta_equal(const struct bpf_map *meta0,
 			const struct bpf_map *meta1)
 {
-	/* No need to compare ops because it is covered by map_type */
-	return meta0->map_type == meta1->map_type &&
+	/* An offloaded map has the map_type of a host map and its own ops */
+	return meta0->ops == meta1->ops &&
+		meta0->map_type == meta1->map_type &&
 		meta0->key_size == meta1->key_size &&
 		meta0->value_size == meta1->value_size &&
 		meta0->map_flags == meta1->map_flags &&
diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index 60c4d84b9aba6f..0cae12c3f70849 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -112,7 +112,6 @@ int bpf_check_uarg_tail_zero(bpfptr_t uaddr,
 }
 
 const struct bpf_map_ops bpf_map_offload_ops = {
-	.map_meta_equal = bpf_map_meta_equal,
 	.map_alloc = bpf_map_offload_map_alloc,
 	.map_free = bpf_map_offload_map_free,
 	.map_check_btf = map_check_no_btf,
-- 
2.43.0

