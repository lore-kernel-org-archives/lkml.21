Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795762534;
	b=DrxekcEPEhEs9wbb2E3FtMC83OCDeohFSUoxFn2RawBhr7NRIiD6MNmWhWolPZYa43BF
	 Y2/m1ZPL3Uh6L+1qftDktxi4LOnYd3I220HTDLgYVqrJkNt9l4ZlUeLejbwAfeKYDdoX3
	 d2vE/MKtTHviwEMZI+Wh7fI0G6RB/74LYyrvihoTjC48s2z4yvQr5fEAImQhsK776S9ZV
	 L/PXeHI5f2VXa2+MV6tsveqsVBB2vBx/aEyqsd/+OojhIf7/1JBNi+Aqp4SBmJDrn96z/
	 6dvgtdYWbdGC6CPbeS556vbjdf4ITb4+x1I+yFwYqqV0obhgx36iTpafQD/XAmwVLXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795762534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6QJZTVYdROR6mS1avmG65kFgpH2ZO1NmsyxFw2KO3To=;
	b=K+9NRugfK7yeCtgniiz0n6sqoFxdd4Crim9j4cqlfiN2IqrnUsDvrK/CB6uhtI9rzF8b
	 HsWG5rcdlJlatgbcvZTKxeFHUI7Rm3B4WTIX3HSaLxDSVZ/9S5sLPkNqyVHnY1Rj8ZlCO
	 p0X535fpHB7kaOxJFThRDfvNLgUI6U6HPUMpXPk1w8jOCodCrNeIuBAij0aHvwLgj13vK
	 VH4oyxATzum0Mff6atuT0aWmrBzo8Ugg+NKWo056XSB+2Kjl6rYuiXrZ5+QlbgCl+RvrW
	 ocUhSTXjEere5Zruo1/KygL7EovKdXEsqPYESF2CeAqh/1gRfgnHmMnRmQv8QQbAnQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LdqY3BSi;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D35606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45D35606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LdqY3BSi
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-492f0a1b685so5493442f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 22:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762533; x=1796367333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6QJZTVYdROR6mS1avmG65kFgpH2ZO1NmsyxFw2KO3To=;
        b=LdqY3BSibT9kF8yeS43kQZ/FcJobH/xrre6CcpWd9sYdjaH+RVK/Nyvj7/c67jyFwI
         9sfScTqFN62NcDxC5j4WNPAj7qC5FMdks8XSPuD09KFtGu8yvt50sfnD7QxiSUmmpCxx
         AmPy47/aWVPE+iPaxEBok2F0wErj9/jCxml+TRtUgLZ0g1MJIhdgylrOkcWZj7odj2zO
         QUs908hefcrq8Bgn3d6s81+zgCOXP/a4QjXN78Fgykh5YJpq+aqfVXQ6ISg9GrMZd93A
         1rgU20yzIGRQhUKNporX/bOFKakp4k10Pr6IURHBYP//KouFgs1D539uk4ALtJjT/9aw
         BfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762533; x=1796367333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6QJZTVYdROR6mS1avmG65kFgpH2ZO1NmsyxFw2KO3To=;
        b=z071ZdG0wolt83E8V1b1YeVcDjnS7Ki49O3Aclklu0czHm5BjMTnzGi2it+gp0wQFR
         ccfxHGeoK/Qi5EzddTCKzfDj78v2YsxnpMuMRAJ8MX+tyGno8/Lt33uBYNsk+gd6EI++
         tD0M049y9S0XPKwMbIk9VArD6tMx83Eg5z3jRsBtyAAkJXNdxmtRUzEAsN1FSDFBgV1q
         mn73+DebeExqK5yJ6L6zyx8IbzoK2l2/FkRFBZMS79tXzM4Sz0poEECW2BlhpD5/SvZW
         BFBAtKOqdD5fIZR9JNCvPR1MHkW6yZrRPC6xWL4r5o7juXQNrjOtS4W+oNGL3MG4upJV
         UISQ==
X-Forwarded-Encrypted: i=1; AL+hErH8sp/XnwTE8w9UWHadZycXdnMXGf35Z9G8bCADcXYiJxGeQDgJBsGxX6RWJuF7uEiztduLAi9q/KSoLiQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sK2OdD8sQd8j+E+5ntD8FHTlGh1pkrbNQiUYY59Ta1xPzkXU9
	Py9usMQUTRPmmJwj21qCV6ECCRYZGfsrJdhHsSN6LBP/vH5fKjxxr4Ib
X-Gm-Gg: AZFdTZftHq14ZGTehKpM5d6lnU7iniu0dcZJhqaeAT35GhRGX0j/jCJUJQp2BOCQDc1
	zqtNPHnhO0HnBb2XE5NqEXyYILt7XNm3+Aa7yKsyX/D1zIp6OTO/Y8ttkYwzzCVNB5+T7+P+Lvj
	1lo9yNpPCcWx6ej5QDStqaHEsIbCstGqL+uBmBCoSfiGzvnwhaASAPnCh7lzjkf0/adkl/G/hrm
	fc4AcFfdP3VxZRfDMgV139mVKRuMaTmDNk7dKLnAN/pKF5M6FEuC0zVlHaCgk4arJSC5350UBYX
	9UCT9btPkkHOh4Rm9UhGVH1aQrIJZVPukEcaLMcSP0bSLaAIuNW6VgUoZssxSELp9O5Adp9e7qx
	yxr5RxUMcw3OPBTfIqCGH5P+9J7aPbODXie+iPEvdeBuubO6f2n1WvcJauLWDF46p54KqVG+BVS
	Qv+YEi46QsMS1rIBiHHXmSg2cOe9qU+Fw/rtZToywbaRfyVHMq1WtZsbe8TqWc5P1jW2Tpp7trY
	UR0xulvbA3bB+Iomb0Uk5L6feotQAkUCa+jOpy8mfeVPCRB+y+EiBUh1z3eZVIZd/fGXhY0fSoX
	0BENqkukKxoG6FLkZEWTFrhi3+VMqA+BbyYRk7JLT+EIRvkEBeZXCwXAhH+qKkTaeNTsT/Czga7
	Hn7oxxSPH1cL3T2JS/C1eDGnH78PJaJOaKB86ix9SnnQps/IEdfzbwt1oZF4HFHcr67nGjTarA6
	WkG1a2V+U0tYzdcJRjKQ1tErgPArfb2LIoGfFmk561uv2l1DstjLyxQCcrfmaVUBh08vabjLkFv
	sCSH/xp/DCyE8NRA1Q3/6U6zuBhBwNaLnfjaScKUtc=
X-Received: by 2002:a5d:5f86:0:b0:4a5:ba8b:e00e with SMTP id ffacd0b85a97d-4abb4f5a324mr44654273f8f.45.1795762532450;
        Thu, 26 Nov 2026 22:55:32 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm42574611f8f.34.2026.11.26.22.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:55:31 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 2/3] staging: media: cedrus: factor out the format check
Date: Fri, 27 Nov 2026 07:55:22 +0100
Message-ID: <20261127065523.3685726-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127065523.3685726-1-jernej.skrabec@gmail.com>
References: <20261127065523.3685726-1-jernej.skrabec@gmail.com>
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

cedrus_find_format() and cedrus_enum_fmt() check the capabilities and
the direction of a format in the same way. Move the check into a
helper, so that the VP9 decoder, added later, can exclude formats in
one place.

No functional change.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../staging/media/sunxi/cedrus/cedrus_video.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index 2521315abdb7..a46820a90d87 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -78,6 +78,17 @@ static struct cedrus_format cedrus_formats[] = {
 
 #define CEDRUS_FORMATS_COUNT	ARRAY_SIZE(cedrus_formats)
 
+static bool cedrus_check_format(struct cedrus_ctx *ctx,
+				const struct cedrus_format *fmt,
+				u32 directions)
+{
+	if (!cedrus_is_capable(ctx, fmt->capabilities) ||
+	    !(fmt->directions & directions))
+		return false;
+
+	return true;
+}
+
 static struct cedrus_format *cedrus_find_format(struct cedrus_ctx *ctx,
 						u32 pixelformat, u32 directions)
 {
@@ -88,8 +99,7 @@ static struct cedrus_format *cedrus_find_format(struct cedrus_ctx *ctx,
 	for (i = 0; i < CEDRUS_FORMATS_COUNT; i++) {
 		fmt = &cedrus_formats[i];
 
-		if (!cedrus_is_capable(ctx, fmt->capabilities) ||
-		    !(fmt->directions & directions))
+		if (!cedrus_check_format(ctx, fmt, directions))
 			continue;
 
 		if (fmt->pixelformat == pixelformat)
@@ -191,10 +201,7 @@ static int cedrus_enum_fmt(struct file *file, struct v4l2_fmtdesc *f,
 	index = 0;
 
 	for (i = 0; i < CEDRUS_FORMATS_COUNT; i++) {
-		if (!cedrus_is_capable(ctx, cedrus_formats[i].capabilities))
-			continue;
-
-		if (!(cedrus_formats[i].directions & direction))
+		if (!cedrus_check_format(ctx, &cedrus_formats[i], direction))
 			continue;
 
 		if (index == f->index)
-- 
2.43.0

