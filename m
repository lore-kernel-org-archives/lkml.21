Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795874863;
	b=F7b8O3FhcNSR2LlFbfbu4DgYt67cU0/BC1PmXicPQlwiibO5w1uqLpR1nthKL7BF1cnQ
	 Kx9CuGhAIjAzmUykq7gGxfj6y0tThWF7NzVRJ/bdLln57NfLZO74iQsfM2pB0JFKvSKSL
	 KK/9VlzFuzERWSQFiHwZ05Z01J/oelRtS8fJmwjo84KieEKBL+88TT5uN/IHRSierYXzs
	 Rh4V8K8gi4s2jFZCpArRWgTwrl6d7SZMIPd/n2ysaHn4H33CE2J4Cek55d7IYzTrl7xNQ
	 V1aElIuQwsJ6y8afIDXjJ7oiXECcNyzmkm5OpUz3lf3HeWvs56rIK7MRq6ta2yAUKEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795874863;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=4+6KQuyL0E3p3oxhKhM8zgbrpNWedg2mBg7UCQkIATY=;
	b=5DN0/qZhTcMR3faJKctxpVTDt/ZjPoGGglTUPw55LcSRWqVXK9LpQbNnI13C8vXnKGZp
	 rUL+46Tvm8ODd9oFKN1sgY3gtPG1q+6NPsU4hWVrPS71GxUTmU9emrb87qMBZjKm5U2TU
	 fKG9wfpr7pNt2nZjgk7Uz72YfrmVclF2quNMwee4DiHcs7prY7phEJCzoE/gsNoBXCDyu
	 OgLRiO7nI5XmlX0YLC4ym9sZfTO3PNrEgF645OgIFp7VvIE2j4PCnNCCr6gPQWAQyVld1
	 7PiJDfq8ne1GfMUpzFxX0hhMuHYG/3NykLv57ImjyrMSqCXRO2vvAgrFTw3Fh1gRCFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=YcrihPzs;
	arc=none smtp.remote-ip=117.135.210.6
Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EDF606A688
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0EDF606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=YcrihPzs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=4+
	6KQuyL0E3p3oxhKhM8zgbrpNWedg2mBg7UCQkIATY=; b=YcrihPzs/cw1wf7xiH
	laUXaqrKr7TaghCpoXDECpGJKL7/2kX4ctZmXxrerjaqktfxEcpqUe34kp/8DgPT
	p1/EfG6SEXrno4ADjXDEqSFo5wms15rHgGC+lQLa3+1Mo00JokRrsD+PwTJ0vIzG
	i5dALdKlNYPaSr11awa7+kd4A=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCkvCgDnN9f_3wprDjnOCw--.23165S2;
	Sat, 28 Nov 2026 22:06:57 +0800 (CST)
From: Bilal Hashim <AeeSec@126.com>
To: Rob Herring <robh@kernel.org>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Bilal Hashim <AeeSec@126.com>
Subject: [PATCH] accel/ethosu: validate strides, format, and overflow in feat_matrix_length()
Date: Sat, 28 Nov 2026 22:06:30 +0800
Message-ID: <20261128140630.1172-1-AeeSec@126.com>
X-Mailer: git-send-email 2.47.0.windows.2
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
X-CM-TRANSID:PCkvCgDnN9f_3wprDjnOCw--.23165S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWF18GFy8KrWxWryxur43Awb_yoW5Ww1kpr
	W2qFy3Gr1DX3y09wsFyw1DXF18WF1kJr4UKas5A3yruFZaqr1UWFyIk3sxWF1xZrWfC347
	XF4ktrW3Cw1qgaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zitEfwUUUUU=
X-CM-SenderInfo: 5dhh2vbf6rjloofrz/xtbBrQGVMGsK4AFPmgAA3c

In ethosu_gem_cmdstream_copy_and_validate(), `cmd_state_init()` fills
`struct cmd_state` with `0xff` so that missing setup commands can be
detected (leaving `s64 stride_x`, `stride_y`, and `stride_c` equal to
`-1`).

However, `feat_matrix_length()` never checks whether `fm->stride_y`,
`fm->stride_x`, or `fm->stride_c` are negative (uninitialized), does not
reject invalid format values `(fm->precision >> 6) & 0x3` greater than 1,
and performs unchecked arithmetic on `addr` and `addr + 1`. If a command
stream omits a stride setup command, multiplying by `-1` shrinks `addr`
below `fm->base[tile]`, underestimating `info->region_size[fm->region]`
and weakening the BO bounds check in `ethosu_ioctl_submit_job()`.

Reject negative strides and unknown formats, and use `check_mul_overflow`
and `check_add_overflow` when computing `addr` and `end = addr + 1`.

Signed-off-by: Bilal Hashim <AeeSec@126.com>
---
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -206,7 +206,7 @@ static u64 feat_matrix_length(struct ethosu_device *edev,
 {
 	u32 element_size, storage = ethosu_is_u65(edev) ? 0 : fm->precision >> 14;
 	int tile = 0;
-	u64 addr;
+	u64 addr, off, end;
 
 	if (fm->region < 0)
 		return U64_MAX;
@@ -237,24 +237,43 @@ static u64 feat_matrix_length(struct ethosu_device *edev,
 	default:
 		return U64_MAX;
 	}
-	if (fm->base[tile] == U64_MAX)
+	if (fm->base[tile] == U64_MAX || fm->stride_y < 0)
 		return U64_MAX;
 
-	addr = fm->base[tile] + y * fm->stride_y;
+	if (check_mul_overflow((u64)y, (u64)fm->stride_y, &off) ||
+	    check_add_overflow(fm->base[tile], off, &addr))
+		return U64_MAX;
 
 	switch ((fm->precision >> 6) & 0x3) { // format
 	case 0: //nhwc:
+		if (fm->stride_x < 0)
+			return U64_MAX;
 		element_size = BIT((fm->precision >> (ofm ? 1 : 2)) & 0x3);
-		addr += x * fm->stride_x + c * element_size;
+		if (check_mul_overflow((u64)x, (u64)fm->stride_x, &off) ||
+		    check_add_overflow(addr, off, &addr) ||
+		    check_mul_overflow((u64)c, (u64)element_size, &off) ||
+		    check_add_overflow(addr, off, &addr))
+			return U64_MAX;
 		break;
 	case 1: //nhcwb16:
+		if (fm->stride_c < 0)
+			return U64_MAX;
 		element_size = BIT((fm->precision >> (ofm ? 1 : 2)) & 0x3);
-
-		addr += (c / 16) * fm->stride_c + (16 * x + (c & 0xf)) * element_size;
+		if (check_mul_overflow((u64)(c / 16), (u64)fm->stride_c, &off) ||
+		    check_add_overflow(addr, off, &addr) ||
+		    check_mul_overflow((u64)(16ULL * x + (c & 0xf)),
+				       (u64)element_size, &off) ||
+		    check_add_overflow(addr, off, &addr))
+			return U64_MAX;
 		break;
+	default:
+		return U64_MAX;
 	}
 
-	info->region_size[fm->region] = max(info->region_size[fm->region], addr + 1);
+	if (check_add_overflow(addr, 1ULL, &end))
+		return U64_MAX;
+
+	info->region_size[fm->region] = max(info->region_size[fm->region], end);
 
 	return addr;
 }

