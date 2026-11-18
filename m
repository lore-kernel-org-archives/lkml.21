Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795031513;
	b=nlJmx5UQ5IngzTCZZIxzO9K3x6fGzkyjd/eE6vGJZ4K87UlumA1oqYqsLqpkwlGkVbtq
	 ivQW/H3yhZSfcI8076AfMwquxhY1Sf2AzbnmXs08DF+wnLp3UOg9cTvbJPilLk/i4xRX/
	 h8vG/dgcofU6KiKvDBaw1L3GLSI1/2c6h7nYXgt7T0/EhQJT08cFY0fStJYdmNu0O5P2R
	 ZCDT/DPw1N/j4iUDjtKnfYvr+kwreAxe0mGzknXQ84FggSo2jlz9K36kwqSiC+43yzRy5
	 cIKmtOipRYoSHkbfJ+UaIUTyc5fH2vfciKORnmre4bNTChiQIYLHDSHeeD/OR5q+mPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795031513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=u2pWo1k6VdDiNoIV1DHvLxSWgtzgZlC0d9279vJ2m+w=;
	b=4MKORwafUOVTFSsCkiUVYHCB0vEKRqp0U571Lp2ZCxdQICPeQnET3lVMB6qeCW7eBIU+
	 bx0uUa2aRb6h+5wi5dfPND4nECpcUZt/oAlKpcdHMm/vhV9HPNpy6B/QOy3TGsbALLHio
	 xnJ5Pw0788ghr8LvKKrLJAzXw84pr0IuOp9m2ZMZcpPvWW83XMKO0ORBtomyA32zK1rUY
	 +v7AVoVa/RXhw9N2iITC4Q9TK1ey2tLgHma/1jlC7Kw/4rCr+J/aaAz6XCL7HujOOIvJO
	 jk883wnJixatsgcq/nuxKv3Pk7bwpkeuPHgzpz3+ncGXdT2YBBJFjnkYbCXGqX+z8+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cb9hOOdu;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3C4606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D3C4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cb9hOOdu
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso10713495e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795031511; x=1795636311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u2pWo1k6VdDiNoIV1DHvLxSWgtzgZlC0d9279vJ2m+w=;
        b=cb9hOOdukV1fmXVjkDW9YhdSXYFxEa8vXloF53g/mw4wP0q+A1W8jaCsfhPdMaadjk
         k/c5KSrAYLbENohdCbNW7AEqx76om/CafjUc+3HJG2BpU3Vf/qwggQzrHB0V64Is7xKL
         n55MZoDA3XdGOva7PwjAxrwKt5H0Lux5kiM3MLiE0WBMEw/9glMChnveVl4AZR7X2GNi
         nNLL/tPgOsEI5GDkZ93aD79GImF/tpg7chHv/aTPcWWcIy5w1Sl90wB2SbMzzvynD/Do
         VJKczC1ePG8ZbWpbuOfuM85e00GuKRsFCPbbTHrZVLUdnlrebrBAjb0jOzdF/T095p41
         xKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795031511; x=1795636311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u2pWo1k6VdDiNoIV1DHvLxSWgtzgZlC0d9279vJ2m+w=;
        b=vN8+EPkXNlNYfr0iy0/BO4baQKkcurz7VIx2BkDV2xxRuO8FIdS99H5iA4a4/iNSDZ
         X9mxFKlw58WKXeXebGAB+zMcjc9/cm2odIARgwGdMCyFMIvLgIKHxxuHoahQNo2GR0R6
         hMK2vVPwlW95hP0jqK8TeizO0QYDRUfhdTa7n3bDET+vaJO6fkqnKR1IYuZEI/vAuAf3
         j0uq5OIlFwJeVZUeJJRCHDVm0ip+7xMh5PEYrmZjwx7syFYzw8VA8rxIYvzRYTAvEsfv
         vI44o7GyQSEzsRPQHHEdLvxVNzFLdHVdB3lYVG/qFFCaPItKBC3GPWHixmlpn5uxf/zF
         1+6w==
X-Forwarded-Encrypted: i=1; AL+hErHwlXmX7P8WsNrp1gxwVhe6OwVXYJ44I1SknTsu0oTJMS+++gvCTmpMMzabFCXuChOzkOj/TndH0ZsH+Z8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gYxLrkpGKGJ4bUnuYpupcB4Nevkhmo4f7H3vLGmMl7fq83pns
	8IMxFQG+8gmJ3zMvVYxoA0qGPhlznlTAdZ61MEuBJEL5hYoSs8QF5+/d
X-Gm-Gg: AYBFou1BNFkk0tU2z79bnXPwf/DIZYAYY+23k2iV7vQEPV+wVVw3Ase8VxOVYfTc9X3
	hQK79xngFcB/1jvRMMLIRZGRXnqcqzUTOMm8SHcZ5U3GouER/IROoofUz6KzyLhu/6RfxUCAohm
	0Z/zVVnwQMSYuQUqs4mL6f4LqyPesCjuCv/saphruXwBPCT0nU5EBL+l3dXylr7AvVSq6aDYsDu
	ct6bFmAXxHB7l7QgMjnn2xBpHerFj035E0mCVZ1KmM0RnawI7IkCvgo1PyPdZfwhtHEinmLEICw
	lYPnWO7rMvAORjmoXDAeL6CXhsMPFifmhxxIY4HKH2cNW5HRkeUMjFC+Dh3pSwp6zIuhl2s3/hF
	grU8k6E2KRQ5uEB0vxy+0nHieKqqE+8sPK8pj+6GJ4T/4Urq16Yf1izX6W48EQGP84vuJ+Ud7ew
	noB0lO3l/DJmfSlrZeQd8IU8IH+Yup7rfGWbN57FEQDmL/l6nphbk9A/kZOTZYECqSAVrj752k5
	8m++pep9ol/ivfuhIBvr06ZWQewm2tPb3YwfEq+HfOzoU/juZJXDcVX+D25+Tr6YZhzP5XOk3YC
	jclzxTIQv/gP6Fypt7IKVo0db15IQRH33BFXi+ZkF4dVam2vVuOF4Euh45MLhE8dscxB6NG4bv4
	RsWCz6rWbQSTNDxFhuQ==
X-Received: by 2002:a05:600c:a41:b0:4a1:fbd2:f689 with SMTP id 5b1f17b1804b1-4bb7da13ad8mr74172095e9.7.1795031510930;
        Wed, 18 Nov 2026 11:51:50 -0800 (PST)
Received: from Enricos-MacBook-Pro ([2a01:4b00:b82b:de00:c5e0:cc6:391:83e5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d4f5b87sm60555095e9.2.2026.11.18.11.51.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 11:51:50 -0800 (PST)
From: Enrico Lorenzoni <enricolorenzoni59@gmail.com>
To: linux-media@vger.kernel.org,
	Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Enrico Lorenzoni <enricolorenzoni59@gmail.com>
Subject: [PATCH] media: cxd2880: fix carrier offset for negative raw offsets
Date: Wed, 18 Nov 2026 19:51:35 +0000
Message-ID: <20261118195135.92439-1-enricolorenzoni59@gmail.com>
X-Mailer: git-send-email 2.54.0
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

cxd2880_tnrdmd_dvbt_mon_carrier_offset() and
cxd2880_tnrdmd_dvbt2_mon_carrier_offset() scale the sign-extended register
value by the channel bandwidth:

	*offset = cxd2880_convert2s_complement(ctl_val, 29);
	*offset = -1 * ((*offset) * tnr_dmd->bandwidth / 235);

tnr_dmd->bandwidth is an enum cxd2880_dtv_bandwidth. It has no negative
enumerators, so GCC gives it an unsigned underlying type and the
multiplication and the division are done in unsigned arithmetic. A
negative raw offset wraps before the division, and the function returns a
value near -(2^32 / 235) Hz instead of the real offset. The DVB-T2 variant
has the same expression with a divisor of 940.

Positive raw offsets are not affected: whether a receiver hits the bug
depends on the sign of its crystal error relative to the transmitter.

No in-tree code calls these functions today, so mainline has no
user-visible effect. The bug shows as soon as the value is used: on a
Raspberry Pi TV HAT, with the functions wired to a debugfs status file in
an out-of-tree build of this driver, 8 MHz DVB-T muxes whose carriers are
about 2.4 to 3.2 kHz above the tuned frequency read around -18273794 Hz,
and a DVB-T2 mux at the same site read -4565734 Hz. A user space model of
the unsigned arithmetic reproduces these readings exactly from the raw
register values.

Cast the bandwidth to int so the expression is evaluated as signed.

With the fix, on the same out-of-tree build, the same muxes read +2.4 to
+3.2 kHz. Detuning one DVB-T mux by known amounts between -100 kHz and
+100 kHz gave a slope of -0.9998 Hz/Hz, and a locally generated DVB-T
signal offset by -30 kHz to +30 kHz was tracked with the correct sign
over the whole range.

The analysis, the fix and this changelog were prepared with the help of
an AI coding assistant (Anthropic Claude). I have reviewed them, and the
tests above were run on my own hardware.

Fixes: cc438de9df2c ("media: cxd2880: Add DVB-T monitor functions")
Fixes: 55e13167c938 ("media: cxd2880: Add DVB-T2 monitor functions")
Signed-off-by: Enrico Lorenzoni <enricolorenzoni59@gmail.com>
---
 drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt2_mon.c | 2 +-
 drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt_mon.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt2_mon.c b/drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt2_mon.c
index 4e173dd87..e35efff01 100644
--- a/drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt2_mon.c
+++ b/drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt2_mon.c
@@ -146,7 +146,7 @@ int cxd2880_tnrdmd_dvbt2_mon_carrier_offset(struct cxd2880_tnrdmd
 	case CXD2880_DTV_BW_6_MHZ:
 	case CXD2880_DTV_BW_7_MHZ:
 	case CXD2880_DTV_BW_8_MHZ:
-		*offset = -1 * ((*offset) * tnr_dmd->bandwidth / 940);
+		*offset = -1 * ((*offset) * (int)tnr_dmd->bandwidth / 940);
 		break;
 	default:
 		return -EINVAL;
diff --git a/drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt_mon.c b/drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt_mon.c
index 86d5a1e40..c07949b11 100644
--- a/drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt_mon.c
+++ b/drivers/media/dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt_mon.c
@@ -184,7 +184,7 @@ int cxd2880_tnrdmd_dvbt_mon_carrier_offset(struct cxd2880_tnrdmd
 	    ((rdata[0] & 0x1f) << 24) | (rdata[1] << 16) | (rdata[2] << 8) |
 	    (rdata[3]);
 	*offset = cxd2880_convert2s_complement(ctl_val, 29);
-	*offset = -1 * ((*offset) * tnr_dmd->bandwidth / 235);
+	*offset = -1 * ((*offset) * (int)tnr_dmd->bandwidth / 235);
 
 	return ret;
 }

base-commit: aa0f4c41d4870a18e65772a1817af16427200371
-- 
2.47.3

