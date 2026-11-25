Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618566;
	b=ZeBX8e5eFDLFXpFBCq8Wg8h0eq2OM3oeDC/kybIcmNH5rKgkIRthB5nTvwFbzvR4yeQH
	 2v9gmcxyjRAN4BTV+zGVDrAUoKbT+AJokbcJ6ThiUKWurRCvGEzVK5pOvU+lkkmDrF/N1
	 VS6b5KcNH6scbb+65qM3vj2DMA7q3dCyo6guqKXWGqlF8FsOCzLuMlyZE7iDyuvMxX75H
	 kvFGI3uuZyImoCaOKDuMLfpBp1fC0fSC+7gJDDPb/fEIFAh77rZAcGmFa/+ewEvr7OUqX
	 xiQfPxRVZofTGCKq6HgFIUpfJZBr6OoDXp7OhVFfJHi1yUBlIA5/ejLKyWuLkRcGseQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rl+da9c1jVCl3abcm6KB+EmJX5u9xp02QveVywSw2go=;
	b=QJcdQpUiltkF3P35/G322tX9yKMy1XMFU+TqhcsqwBOHdnrTSH4QrC/vA3peS7t6upe2
	 K5bRpszjojFn0i3t3PeZLU5mF6AKWINTrUBjJ1urZHMTXYKxPtKL1GPYW477QI4m8T0Hc
	 dRBAygmorc11mmB3faplIyEp5aO7kz4xEWlSaQFOdE3iVeykae6I369r4MhInMo6asmLe
	 dEXRAtAuBszc6hRtyanVUlI7H9/fMRqQGK/LK6gKywhi764vsk9UNq4ryQX3nH5hb+avJ
	 DUZr3awIhEht4f4dfMLz5jlfzJVNbq8itj4nP0T9m1xiNW22MJZLAow56FSSnND28zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rP3+wvtv;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F4C606A683
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53F4C606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rP3+wvtv
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso5185840f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795618565; x=1796223365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rl+da9c1jVCl3abcm6KB+EmJX5u9xp02QveVywSw2go=;
        b=rP3+wvtvUd5BSIItbmrOs+fMb/0tNd75RRq96JkoqhT2eRlsZpvHYs58csYL9y6jC6
         23pnbPaWHTI7RwfuLJWrG+fVkrzK1tNpTfHSaYctf3Iqve72h8d4lReRmROahuOsvu/T
         suSTKS09GzA1gOQ1e4myNrKP+7403yLnbs/XIJmiFg5fGdEjknPDIozsIJEW30Rb2LZF
         B/LOHyMnSajEVKjqKUfTUHyaIWT5ZAKRHNAMaPDCzBshEJVslfraeBKopAJEhsswOIpH
         EuxLM3ZDnQHzClCqb6tZJBtxYNu6l433fvIlgFI9OWyHQo46c09tLu3U1mNY4OBKBG0C
         2jvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618565; x=1796223365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rl+da9c1jVCl3abcm6KB+EmJX5u9xp02QveVywSw2go=;
        b=SHIvOrgZNSAWTsm0YUX5rujQXh2PNYQKZ0mTn/+xywHa0fio5lxuSkT0NchGIHpmNG
         TyiR0sJw//yAZUTdtk1CLbxulC+ZHiBELw4xbNytuVOPuZLw8J1+9jBk5m9rH5FbGr6g
         9LhfEnOLepdZXbZ/nQhmDkFphBBxgsnw77kYYqAxbCPkS7p5s3zEG39WDBcTSJES7DBx
         peTbntHWml+wP14f4jQLuR0ibd7ju8QRhNkOJHRmynFj5L5GGae9yuUd98GNcVJl+bH4
         dKDKT6MPUxXtUU1OjfVraunQEtUAIEFtkzdY16F6/7vVcH4/0LtPBgulfum39JTkvYt6
         XC9w==
X-Gm-Message-State: APuU4Z8SrAaofT1Hjzoe9gS/gYhic9KfdJB3jx4YNLTW9NyZTLsxEWuS
	lHItw8vadmfVObYOtebqU2QGAU0DK1IQUNuLkQD1wHODRywP+MJrlfAH
X-Gm-Gg: AZFdTZesQGRpCTreO0wvY1Pjqq9hEmHsIEcJiqDzE3Oe6psc7InQwJrLR0jynXDSQfF
	cyJCIT9de98q/xgRJUZymdAJ/sVMFtXUH/tA5oALswrkaOmaCUzIayGwZ6XQ3zNk1R0TK1qVjEn
	NHxzbZhkDKE2dY0qvsiPE4fiH7yZnVjYOczYGGAIjo47R9+hWFmq2lyNdavj17QB4V4SNEG35jA
	105wFgq6V6KAohOvXEmy3wO+Gp70oPtdhLlor7VJcC0mg/fqvqLN3uDG3mSodEXoNURrDzbvr/h
	AsBDPZGDvzRelZ7u1j0/cRn/JPhCtj/ratqzB3k7nINvu0CRzdiXKimrfg8O4JObkbD20jIRxU/
	WHp5hwr98DQ/74QPOtfbEYfMjkgPGYDdPhL8xmy1C6TRLqsvpPjdkRURgKzPUAaw5N82uXmMFSB
	MFwY0FMdVMHEpaijIwpP6ydz7f7lcY9A3QuLIAU2F77EP3xvEjBeZYFoMy/Tw2dIjOZLD2ZGHAY
	We8BB46AgGTQslni+FYH7lQL0V/RkZtbyk84onFyLiMcBaDxlYm6UYpeGUaBQ4tzcvKh+gJs26o
	VI+T2xzx6O4pvY9hyFOsCCl67gj3YvphdzYOeicPaNE4EcYPxlAOi8iQwe2tOH5m8+2YYYZ9DH3
	mJplbLBCfpHWH/r16wWhOIJz0eM4Ac9pN1g==
X-Received: by 2002:a5d:5888:0:b0:4a9:4dfa:c151 with SMTP id ffacd0b85a97d-4abb683b6c2mr32518885f8f.26.1795618564618;
        Wed, 25 Nov 2026 06:56:04 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm36036139f8f.31.2026.11.25.06.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:56:04 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/5] dt-bindings: usb: samsung,exynos-dwc3: Add Exynos7885 support
Date: Wed, 25 Nov 2026 15:54:53 +0100
Message-ID: <20261125145458.2594179-3-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125145458.2594179-1-virag.david003@gmail.com>
References: <20261125145458.2594179-1-virag.david003@gmail.com>
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

Exynos7885 SoC has a DWC3 compatible USB controller, so it can reuse the
existing Exynos glue layer. It is also compatible with the Exynos850
variant. Document Exynos7885 compatible.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
Changes in v2:
 - Use samsung,exynos850-dwusb3 fallback compatible

Changes in v3:
 - Use an enum with the exynos990 entry to keep the exynos850-compatible
   entries together and keep code clean.

 .../devicetree/bindings/usb/samsung,exynos-dwc3.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 8af0143c3e47..25536859e5dd 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -25,7 +25,9 @@ properties:
           - const: samsung,exynos8890-dwusb3
           - const: samsung,exynos7-dwusb3
       - items:
-          - const: samsung,exynos990-dwusb3
+          - enum:
+              - samsung,exynos7885-dwusb3
+              - samsung,exynos990-dwusb3
           - const: samsung,exynos850-dwusb3
 
   '#address-cells':
-- 
2.56.1

