Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618565;
	b=5Nf8jevdzJuEQaQmv67NoWIICg4GpbRsSg0EyRR3vUq8I/RomulEQCkWjxk0TBew24iK
	 U7q4ainoi3Gq97lChEy8ugmsNNrMUCmRLH164BEmHQ75kj+6YZ33iyVhOOqDTntZlLwvl
	 EAjQn2xa+DbOrx4p62+RkabZOk4fBzxXtA1vKiQFopgt4fPc6J3xx3wMwLm7UmVwg51by
	 GoqlM8YTBv6zRMy/XC1tAtr/Akb4gdVQEk0fz0cUTn/cbPcCFeS31cmiLCmA0nIdDwP/F
	 v589iSICXhfKKRElhD+5XoAdpAeaSBgq4FzUUHaJXgj33jkpr0XzWPIECw7lwnWx7kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WN8NOt5B1vHM/uZeQVY0tf9zQ0aBk/9/Aadx9iWoq7s=;
	b=cmDJ2V+9GHMwVWYOomqjAuYfT306z/nxB7zWcBDaail2WbwRuaFVjukEhXLQLK+s5tdE
	 5aLeSDPjLYEGqJH64VH3eVDkMQeKDSC79y4vc7fvqVpOZDhOf89Pb0jIvR90ALiU4z68b
	 yoBag9PmmJvsdfGof/XRd18JvYR+dNFA9d/RTpz/4ZJsHmatut/miWzr6RSbubm9F+1pr
	 /QYGIHLoh9gWIiOp/1zP8iVOc4ZQEmc2fyGUwcQJ54DyxU6+5IkLRC4XbtKRgcerHwa4V
	 nYTl74co7O7fTGb0lDNm+u458sTh2TPZgTtr4QwPuI/jku5P5fIxr+wwd4RfDpa2Wag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="FobxV/cl";
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DED606A33C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1DED606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FobxV/cl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a357b1c649so3433016f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795618563; x=1796223363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WN8NOt5B1vHM/uZeQVY0tf9zQ0aBk/9/Aadx9iWoq7s=;
        b=FobxV/clKloqO1UdxCrv3xpvWs6c5bg3St9Zcvhezhxh5WxrLqd51kvXcBRk9xsnru
         u0jnrpYyRqxAzbc5rbydfIWEbRafIhLTbZeVRoP8B0KIcE/32LogcZVTLQrgVTKKYqYT
         4/FUQvJgAOXhNzVXT5JiZsZfr1bdSon44rBRtzTMlb+EGV7qLDTvEhDRbIs1l8Kx9e7z
         tp0u/OCpRwBPV5A+4k7AMj65FGdxKdXxz4qiO5tkBlyKnzrKm8fXqx+bDULRIz7n8/F0
         GO0GO7qfAGPv0SiGGZAl7anlDx4cfHyz2GYl0sbXT80n+Tu0OhYrTIjvhz5SCm5KbMil
         O9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618563; x=1796223363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WN8NOt5B1vHM/uZeQVY0tf9zQ0aBk/9/Aadx9iWoq7s=;
        b=x6R/+CLU0AcetboLXHtGe+ogNI363gI+nyAkjXDjEGz2TopqJMWpDWTzlT90jBQPUT
         6SX+U5CdkmfOWv5DRgslN6FHVHXDqNMxum1StMB0zSTWkeP+84oJHXKjCzpBF8g4Foza
         hBamJ8Vz/SoxsK1AIuCdosJYW4040jSu3+izYdzT97RoQMiKs3r4BgW3HrZkSIO/wvgF
         zfyN+yNKBc3Z67vqTfK8jeCfPv/9pLD7vVMQQbYv+6gfqEHbdTTOGKfr3JUF4taVBJPM
         f9jMvblZVLF1yPK8X84b4FPGVTmr52XiAnnt0AltxyePa00suGd6i41aRhTuaz1GJQMY
         4zMg==
X-Gm-Message-State: APuU4Z/LDDqKhUMXK5+FvhJHsQb9IMVJCh5HeFEujJ/PnLxYt3Ly7cnG
	B6+AHLxnHDIcaqMYUCVa1Xv3DPjUyohHSbTLmltdyLemwqruoiWwYXlbYYFTlB1mflwfyA==
X-Gm-Gg: AZFdTZfs+bBrCytxlpInXibW5GugZxCZNbdXQt4xevR4szaNMT5wq7Uihoor65mEDtT
	O3ULk/jgB+SVmJFmZmuuXMxs+ojiYvfDjEbW3Qbiw3ZFTmDwwtEH/AR6vx+jxDZmymAwD3HEJpN
	hquzNvbXG/8vuUGkcWCuZYK52iixfbpPAFbqm58uHthZW0kF476IwMW26LEWq5lWoUyhdx0FNYu
	WK72XipjmsNlTzBz+NmHkrJGzxpVEHmWsuqLt2dTlWB3yE1PCBORPdC9pdEWNK4/Cc+qVQEmAZh
	jVuJ5iPRm10PzzB6JKF//81IS2nIHIFP8vP6Fwg+EkJ9cDHEux7nzcO65ForiLpLFAQiNny0w1T
	7i/ppFMJq3gcza4HjDNbHZTCPJdP0TOl+NW89L7dgGZ48XyJp0Zn/l/vmpBu+ukf2NT/0AKB6Q9
	IEt/brM691PP74apxrK3zo+yQ2mpJWb+AWs7GuHGUk93a6gqtJTV+Lprm/XzmGa/MQC3A5i1i+C
	I+PWis3qc/uV3nUHKYF1NACA0OfB7j5eOfyiiYwLdn6quLma9TDL2kDaSq7tJmtRHgWyxWaYt5s
	pIkWAT9Sc4iPpCrQHmu3qKdYnepBDOjzQxYNrPST7CVQH096eW0KvlgCe6ERJ5niAj7UJ49c0L1
	iK4i03IgseQQKDEY8o2LuFPMPJc1eZ5u8GQ==
X-Received: by 2002:a05:6000:2902:b0:4a4:f208:6a46 with SMTP id ffacd0b85a97d-4b58a524c2fmr17778122f8f.13.1795618563291;
        Wed, 25 Nov 2026 06:56:03 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm36036139f8f.31.2026.11.25.06.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:56:03 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/5] dt-bindings: phy: samsung,usb3-drd-phy: Add Exynos7885 support
Date: Wed, 25 Nov 2026 15:54:52 +0100
Message-ID: <20261125145458.2594179-2-virag.david003@gmail.com>
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

Document Exynos7885 compatible.
Exynos7885 USB PHY has two clocks (ref and phy) like Exynos850, which
are already described in bindings.

Signed-off-by: David Virag <virag.david003@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v2:
 - Add Reviewed-by: tag

Changes in v3:
 - None

 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index a1b3d9e6a094..f644a4aa1e95 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -32,6 +32,7 @@ properties:
       - samsung,exynos5433-usbdrd-phy
       - samsung,exynos7-usbdrd-phy
       - samsung,exynos7870-usbdrd-phy
+      - samsung,exynos7885-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
       - samsung,exynos990-usbdrd-phy
       - samsung,exynosautov920-usb31drd-combo-ssphy
@@ -234,6 +235,7 @@ allOf:
               - samsung,exynos5250-usbdrd-phy
               - samsung,exynos5420-usbdrd-phy
               - samsung,exynos7870-usbdrd-phy
+              - samsung,exynos7885-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
               - samsung,exynos990-usbdrd-phy
               - samsung,exynosautov920-usb31drd-combo-ssphy
-- 
2.56.1

