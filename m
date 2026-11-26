Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795656204;
	b=HLqswFbZ0P259KPfEd9xIphY922HZGgU3IAoDi2oX8hl9lLibhzMp7mk360V5WUuEBXp
	 zzZD31WzY1+qbZtw9nRbAe87Ca4O4V26ksU2KJu+35mO8BKYNwXM/atVNA3xfat5cmn/F
	 935stloa9NlgGGuvq7lMTEUn0yak03Pyoh4IJ4GLF+wRG+KZ0L3ECABWhYI2GDdNH7JNm
	 HYD6nsVUbaToqhXTHihiJisLVMkjsvZ+cgbJaXwBRkrbKtMAodc150ZfRMfr1vjbEKgxo
	 HSnVPsWCzgiTOi3ek97unmmb9ycJtFgaKV0iLwUs6fvDDI/j47GJhkByCQhBubt3PNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795656204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T1o9ngBXV17K0T9VIdpByWQ1tf1l/DUIzKNbevHfagQ=;
	b=nTS4jzeINQupO/Yl5lbVBK6ChVLv89W2b9TDtKPB7FXmJx0R3//bK4N0/CtI/czwuQPl
	 NSHSO37sfbDhvGcwwrOviU0VrwgEp4P8eQb8JFIpXXwzpk1gnix9EJNNR4zTaSl1W7F4z
	 n7RrFqadbY/YEBqGIoRVewLkQCwwHCtBTVrh8vWSIRpfGSPBnGjqzU6T6SsAGKkblEdTd
	 4HPlEQfG3uVKZpydlCv26N5CmLML4mO1mYnntXsOCc4K2tgHev+WRjAUFWggt45wta7M4
	 b9pxXkNUHD7cHgfQ9qk2R5iR9UfnZnFu4SzSO3yey3MmrNA8gA2zuj4rSWiSWFDpKFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yRXbTP5T;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970FA606A329
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:23:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 970FA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yRXbTP5T
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-386c71feeeaso2825520eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795656203; x=1796261003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T1o9ngBXV17K0T9VIdpByWQ1tf1l/DUIzKNbevHfagQ=;
        b=yRXbTP5TQtYuK7OdyRczb7T9Yk3ZesyEnPSFVsn1B4/0pvTylDTqC4Th6Hy0elTGcw
         PB+yL6yugxmppigh3kqnxjPOyikH0NgNY8C5+F7Z/k+QzvY9wJ+GYVQe7HvtXCHIUqPl
         aZn3fq3C/gwNNNzHgvOS235NPXItVLP3IK3AXMDO5v7aoNbKV8jU+0xx4FmFrPHrVAmE
         oSLVXjdg5x0gI2o3756rXjtVWP+HQGckxEI190EE1LbtemisdOh44jlNZubWfASTHdts
         pt3jhvuNI4maRqEkjSaTp5I8DcRqTovGW16SwnDz1adGcpikNr9JWneFnEwfFeVm/tE+
         9raA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795656203; x=1796261003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T1o9ngBXV17K0T9VIdpByWQ1tf1l/DUIzKNbevHfagQ=;
        b=WkkJ/OVi8Gdi2ud/1kfjjWfAv2bOHFvtZaRu9E+Hl/WFvX2p7us79L+E1XssB/JHoA
         rEi9gZ47TQVNN1sdYZakEJ+ubLF5kaIuJSS/Y/lebhnBaBAza8sTSgY9wK7UNAFbw0CC
         ZFO2Y++CXmB+KLGXDH+dl0Urg0YfQyx3/ff+Xh+PB448t+x+8R1HC9CH7KWgeKFjG2wE
         rjMVtDR/ycrcsCuvRnqk+KJBQEQhNvHN6w0kl6qiZnsRtYOrdjvOGcUNRPj3xNjHfO5q
         g3f/vY78MmEh57mmsvGicBurlzXIijFa0qglWWjD0aG8O+v4Eq4/MB+DxUw5RmSVKLsR
         mj8g==
X-Forwarded-Encrypted: i=1; AL+hErEbN0esscB3qrd87a2J+UrsGlfMWjaS7GVN1C95yZyQwGZ30eAyovBM2RToiqzru1JJ1KyBF0bpCnJ6ncY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+9wuytJKCWnPx1xsxIW5nNNo+NSpbAPjNuhucSsdjnL5t9eS7
	1V+hq8NL2Jibe4Z2exuvBlm87ZPBtoKixvSRLeiza2UrhaABDVlW4oXE
X-Gm-Gg: AZFdTZdqXDyAnSi3jqaz8ZbQpAiSVk+L5dXuJwyrK6WearYwm9pOfU3xYKs2yyeIhq7
	AQP36i/TLlrZND8hpNNQYVAfUrRRNnsGnpUkItUW93RXG7wohE8EfdANFAtbTbuy22uNr/AwGvM
	Wd/NKqLCPcwYf/nFSz0tH1vIoEINGBRTp5xeny+MSJDdpdDfVatMQlf8pORv8X0Bh/uG0vutnHe
	jutcmaG+Cz/tmMHlRyK2UoGkhuL2dDGFG7QdSoB0A6cLfHHV3uVZKZrDXt6YD4ucURA7JaNH/qH
	rhUOPAd/a5yt2+WpLclcpkwgY1DtZnTxlGBHOhkW0sbsiAKCJT7lkQgkxnmqiHH83UfuSVKr6/J
	v+VuAgU6FLxmcYLJFlFeTpYb21qGE8D3HsLi21fv9dhwJmUDIYA2dgSoVMsOoFdIW2Xri0R7Zsu
	y74PawI8m2mW3i2mlHdUVWYHalvBysau8GPLsli0WapoNd9fbbn5XBYOb440TtSwvlDv5/at72i
	aTg+TL/ZzxDy9DvR3ggdnWDqbUIApQLfu7kZSrMHsFkQzR2KsbC+CfjT/BWvfZP+Hf49zfwRfsM
	qwUr0y40EKukDK1qaK+b
X-Received: by 2002:a05:693c:600c:b0:36a:1bac:6bf4 with SMTP id 5a478bee46e88-38570451dbemr22625193eec.18.1795656202605;
        Wed, 25 Nov 2026 17:23:22 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm59360148eec.12.2026.11.25.17.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 17:23:22 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: amd-gfx@lists.freedesktop.org,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: Rodrigo Siqueira <siqueira@igalia.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Huth <thuth@redhat.com>,
	Weijie Yuan <wy@wyuan.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v2 2/2] drm/amd/display: Document max_gamut_remap_coeff
Date: Thu, 26 Nov 2026 01:23:16 +0000
Message-ID: <20261126012316.2624853-2-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126012316.2624853-1-takano32@gmail.com>
References: <20261121041427.1743954-1-takano32@gmail.com>
 <20261126012316.2624853-1-takano32@gmail.com>
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

kernel-doc reports:

  dc.h:329 struct member 'max_gamut_remap_coeff' not described in
  'mpc_color_caps'

The 17 resource files that set dc->caps.color.mpc.gamut_remap to 1 also
set the member to dc_fixpt_from_fraction(S3D12_MAX, DIVIDER); the other
ten leave it at zero, and the comment of mpc_color_caps does not mention
it.  Describe it.

Fixes: 1c5e6cd8291f ("drm/amd/display: adjust floating point format for gamut remap when needed")
Link: https://lore.kernel.org/all/ec4d7cff-d23a-46d1-b245-921f442b9a7b@redhat.com/
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
v2: The disclosure moves below the --- line, where Weijie Yuan asked for
    it; the commit message keeps the change alone.  The patches are
    unchanged otherwise, so the diff is the one already posted.

Written with Hermes Agent, an LLM assistant; the author reviewed it and
ran kernel-doc on the file with and without the change.

 drivers/gpu/drm/amd/display/dc/dc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index debdd69bbe4e..32bf87fed40d 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -314,6 +314,7 @@ struct lut3d_caps {
  * @mcm_3d_lut_caps: HW support cap for MCM LUT memory
  * @rmcm_3d_lut_caps: HW support cap for RMCM LUT memory
  * @preblend: whether color manager supports preblend with MPC
+ * @max_gamut_remap_coeff: largest gamut remap coefficient the MPC supports
  */
 struct mpc_color_caps {
 	uint16_t gamut_remap : 1;
-- 
2.53.0

