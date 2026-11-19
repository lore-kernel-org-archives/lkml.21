Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092369;
	b=4gzPQ+BVZ+ie3utMUnweg6lGIr/Kks6LSKT0/A0RcskQgjnBGQ5WUWBSUeao6JJ5TxeQ
	 l0AcJtkQIp747SGfHmxA0HeT4XZwVdbajc/+ajh9ScKmZtNTHeTp3Uq9pBH9LaHQ23epH
	 NhYXxOVmQqbX88SE7DCcVfKkX49KMNqqIWiuLXfsssW/grGmvkv5Xq6X+E+ZVl4Nd6lLS
	 i9i3f74jq7yEd7xVsd9YVUtcFJELSKk/DK8iEWSfQCWwHrEJpmO4umeMjJYrP/O6DBxCS
	 DLCCza7w1h7Jr9LqLiU089hzdvuqCKdGS6YE6oT7WKXzD6ZLHVX6L0wUUGvoldY4ROQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ePm/Spv9q5yyXs0Oc6DXANzhxURarQDfA2TJuyX+qkU=;
	b=J6lrVsHL8BYYge8NrXbOW7VWN2vlQtXp1CQWQWUUnBlbWzk8ZDk8ve3rgDEKEr39F3UU
	 jMLlCKXtfB0XeJwWfiiDNFjaYA2s4pcDtJxDp+1akZ+IZqtpJTykevNLt2kc1RRtTni+8
	 gOGfTmHs88eyOSehy5TYZ3kERxgw0w5cigbvCEqTDNzFHTx/1DaYXziPfgGm380HoDWdn
	 110FEssJ1F6KvYlt6xPtf/YIHmQbfk4wuCZ3bAsXUX6z2LuKLqfHSB+0dOUnSFwmZ7zHj
	 T9+/AETc3VQuko/Z2sRksiDXBpgYSFE9a+e+Z5xJyg8wql5+O9oy4g06W1fX1rpBa+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eGMgd2ng;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1C2606A334
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:46:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F1C2606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eGMgd2ng
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1aefd1bf74aso656069c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795092368; x=1795697168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ePm/Spv9q5yyXs0Oc6DXANzhxURarQDfA2TJuyX+qkU=;
        b=eGMgd2ng2EI8B9auSEnhajKEhF/DR+W82tjNnmMAYpAjISoH40lxzgr1oGOKT5eaax
         y3Qc4yvoqWIu80sCPe5bM6A7Z+2HaykJg1Y8sV73yWbZ7r2V2o3snW/ptU8pYQGyZKtM
         1VkwCQJwYCYt6QqCcD8rsHNn5WiwA4s4uU3wU+uJ/C44pmLeUeITyTtQLD3aClkVz4VC
         ku5KEqpNESdcuTlO1Yu3mDOYo2aOYQs9VUpNhf0jW8ugt1pzmxtr0amsrtCLAI11224O
         d7S5aRYf8Yg/Yad6xcKB8KVhbwp0351SYBQIo6XZJK249vQmx21NnovrhN/g9N2Rgiaj
         uUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092368; x=1795697168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ePm/Spv9q5yyXs0Oc6DXANzhxURarQDfA2TJuyX+qkU=;
        b=BuSWrjDiDpuFvnkH3md059lvv1iARDjLYd1enIsSOIk6LZAwAzW0UW72NfW9QAl3QO
         LpqVO6YmqRV3VwSPMv8G0E0kBdLpM2DqcujJX5FFWXuAV+uu7ObGsWZbXcmxmDb3nvUd
         F1Kz2f+Amxt7e327ReMwydr0GnqUWuBgfhWOX2jC6J5vWuL6TJPjaXQk3uW8UBFq4AkR
         lNt1HKQ9OPFLKRzttLUG75MuyS+QTCd2T0OtCG7tRYIYIp8iiMpSKf/i0KY5ED+ajZog
         aVh2LVR7t/I4FFO8tnFd5Q3IlTJ/tFC1zhjWM8bqN8vgmlUk96hSC7VOyt2snsGdRjWf
         qKtA==
X-Forwarded-Encrypted: i=1; AL+hErEFz/pXrYholgwXjE2UFLlCQ1utTpP3fl1rEv5HlB2EwY0miy0oGq/rRayZsNTiRHfKAphcH+ge5qGF8rE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tFhaJKOGRlrCBz1g9wkymHgUWVRfCIFt9uLuz+97F3tYRLQwn
	RQrvA9vjB+tNQQrRpsWjReHEyigKWGZT2I1KavmX7VqzvK8mhmnA4BQ6
X-Gm-Gg: AYBFou3Q2I26LDgRav3NjoMfX9US0YbFz3zVpmwvxPBeNuBrWCVjKZmLUbrl2eRIH9Z
	WanZ556LQ33VpajTBM5HZdAJkIsmU87rSti8sFC8XACHARB8CthijwAxckF2vqVWp9OZOrEpH3d
	9m5kr3+0ju1iX8bdjDOjnR26G05XtlVjRQxy6PLOR/S9uZerGM2QFwOR0qtHeO/kkxZ6qUPDzW9
	++UQjgiNEtcM1nd2baXFlVl4tMGG+C5YFrbHwh1BxguRAYr0yr98e3LZ62weNxn3JuglO2BQZBu
	FmBLoMXdFi3Giw+TEHgN84iqv9gy//uunWoOM5gWzmj4NDs92olC+1/Ruj02JxBwt50ctorX+vJ
	rrm2GAqRT6YJu+tKu9vVd4PlbEK/Jo7CG6aw6T4j9OZWAjZr4u8d56NUpiSxdMXh6byd92I1Drn
	nZW47sulI5bHFNwbL+ep+wCgEaHLOmX9YW6a/Muym4fO+NtdkkoGqkNeSuSaO1L3/ZlCoaA5/hG
	oEfXVCFz4Ea13KGpkEsPXHEyjGf22IaoBdM7ZXgvExRwJQ+KusFb8+1QiVhlQaWpNzMCf8Vgt1w
	VzB2dX8h0i4SUrs+N6u3eNbS9IBz6blyuH8=
X-Received: by 2002:a05:701b:2810:b0:159:f192:5290 with SMTP id a92af1059eb24-1b5524b591cmr769675c88.13.1795092367360;
        Thu, 19 Nov 2026 04:46:07 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:11e:f696:8454:757])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447da7e0sm22350329c88.9.2026.11.19.04.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:46:06 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	heikki.krogerus@linux.intel.com,
	abel.vesa@oss.qualcomm.com,
	abelvesa@kernel.org,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	effeffe99@gmail.com,
	prashanth.k@oss.qualcomm.com,
	yongxing.mou@oss.qualcomm.com,
	peter.chen@oss.qualcomm.com,
	tapas.rana@oss.qualcomm.com,
	vkoul@kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
Date: Thu, 19 Nov 2026 21:45:57 +0900
Message-ID: <20261119124558.1548-2-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261119124558.1548-1-26rote@gmail.com>
References: <20261119124558.1548-1-26rote@gmail.com>
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

The QMP USB3-DP combo PHY stops the USB3 PIPE clock when a Type-C
DisplayPort pin assignment gives it all four lanes for DisplayPort,
while the controller can keep running its USB 2.0 port. The controller
has to move to the UTMI clock before that happens, so it needs to know
the Type-C mode. It does not route any signals itself.

The Type-C class passes the mode only to graph nodes that have the
"mode-switch" property, so allow it on the controller node through
usb-switch.yaml. Orientation and retimer switching do not apply to the
controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
v4:
- Add Reviewed-by from Krzysztof
v3:
- Drop the mode-switch line, the usb-switch.yaml reference allows it.
  Disallow orientation-switch and retimer-switch (Krzysztof)
- Say in the message that the controller does not route any signals
v2:
- Use the common usb-switch schema instead of a local definition

 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index b77c02c64..fdc2bc8d3 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -158,6 +158,10 @@ properties:
       HS/FS/LS modes are supported.
     type: boolean
 
+  orientation-switch: false
+
+  retimer-switch: false
+
   wakeup-source: true
 
 required:
@@ -170,6 +174,7 @@ required:
 
 allOf:
   - $ref: snps,dwc3-common.yaml#
+  - $ref: /schemas/usb/usb-switch.yaml#
   - if:
       properties:
         compatible:
-- 
2.53.0

