Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578222;
	b=FRbHzgxBkmrOlJfJ6wf3fkTbEUrOb8vIdb2i+DH0i293fph2KI5hF07xx3IZOxKyWcdO
	 zZ3J/pg8TBwrcf9tMBixUARssrpWP9AFiGWwtUINWY+jKi4gc2xIof/OojTvgE/1XDj4O
	 hKYhzeeTioMrkw6GHjzaYL2mID0P0dVb8FoNftYnk3JrAbhsUmuJXgyKRx9+3lMT3Kdpi
	 4WbnHVzVtBtw1YqDYiu/gC0zn2YkFXn6ASUC98QFTf6CQB6Ef5vfLrmnsU6Gm1xlkKocE
	 uuFnP/q2rs2K+3g87Qe8sDML05rnF0VHBqDDg5nRsFtWMvPP2QA48uv3Tq70KvQtj9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=dpKnhnsaRxCp3BhNS6dMqX7R85atmEMYETrpv/6MbAE=;
	b=oGJrefjd0ePjwcmLkFQMvnlEJRH2qwcdbHRkPAtzDOGQqcSMsaHg48IPER/vuAUAlLW0
	 3aeSHykRku/z8S+c/Js0GnO41UCO7nPMrhObVIcoEDgJVxQ5XQLmEzoN4B1JAj1IRtZ+V
	 ti3CQpt2Qpeofmk10IRPnmY6qIljny9hKqKrv1h+4eVY9/AFDOiRl/UgZ0diyX7kmkXGG
	 IEX9NWCYnjVq/iod7t/aD/af7Kik5Oz0uarSDeGbt/Nyc5/xcMMs7IajVF7Zw4L7QnhvX
	 9rgBPXg0PUFWgM3SQ2f4tD+sFu54/EOGVU63j2i9FpswRzBmlLAkRDtBFldPKNHMIcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0gL35YaP;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49875606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49875606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0gL35YaP
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so48469965e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578221; x=1796183021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dpKnhnsaRxCp3BhNS6dMqX7R85atmEMYETrpv/6MbAE=;
        b=0gL35YaP581fK3jcOJPups+fF9Bbf8JIZtZt5mMf57n60XTFjn4kYofnxX068yiYH5
         FuQ0yvkMTBi4fEdB55IabfGWqM2T63H29uww7lNh8DHLTv1kOBJPGaeo3AMOqMSSU+X6
         3LdUBD9U4cj47O/R2+eBKO3iISBcpxscvMpW/pqZcRplromX81Z3/RuRNnC5/EG5rPmk
         BQKfdN7YeHa+gsvJFgUsSAByJJs5MW9Pda01hnPON69QF8pF0jxAMkykIR7oUfizwaCg
         kbnLzik97Yu5Gv5WsFhSEW86b5D4gcno5s7wlSNmKItRT/jR3gKoc8KIJ8tUtaqOPD+Q
         iaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578221; x=1796183021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dpKnhnsaRxCp3BhNS6dMqX7R85atmEMYETrpv/6MbAE=;
        b=GTilGgzMht9043T3WWQmq5ZcgK7YB1gpulubhHMJovljs4PHTgdW/qqm2hspW2kRlt
         hZYc5u/TCz5hq+ODNCrq9epWBbPmHuoJWNGApFFTgMcenThIa83AKoOtF6i/36Jt9uC8
         Gh/QDgalTdAaOTpBbFKoNCQZJo32Esi3oAm3aBRJaWovFqzlvDG1M22ClLpP6jN2LNQi
         aDZbw9mZzYcxl3dxlMOsAHkid21VBWb9dUyz5ixuqKPeaoi79uydX2uLGiJRtgnhTUJJ
         ZW2r2s9z1KIxmanuR47vemfN8n2s5pkFYyCPo9WkrTyxEG9CM2gwhjiq2hdaCv6JpIRN
         IosQ==
X-Forwarded-Encrypted: i=1; AL+hErHxNkA/KFpZnVDG2BYvU3vz91rR/mCnLrW2FgeT2BdVmGa8PViAyGffo4lcRZwNv3kKx+dZlmeaDoDOans=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hZBCNDwfOrdGQ1SNNNBlmapV40o7fnWHPxzOjSaGPofStczqm
	e+K39IEUiVRFogVnG/zHMZh+wynRdBmg57TF6pfuAASKIdt9g7zR850O
X-Gm-Gg: AZFdTZe2TRR8UR7TIBB4r6p6rpAFoREoQQbwEkGOdxUHdDyxZfLZXERE+XD+oj1KMjH
	SxnLzFK8eDCdiVmojGiQoRvu5gkswimjN7bsiO9PlbyIRYkVI9pS4FAVpoBVtLQACsuF52n6aLT
	S5UXZSIczlvtwWG2PP0kJ3kdrpQ7Iy3lEVE2TZPcSVwY4bN5z6CotyCzh3mv+dyk75viMJeDBnG
	MVnMcz+vfaXaPS5ze0aCD2wJV3t/UDTLc9MlB9xQWJ4bhEXIBSEdKWbQpqvRfCjEiX5ITxEXUZb
	Ado59A7XMMxrk656AiRYQa7Kt3mdPe7HltLeCjKI5Hm+nl3QIcQ48HK4ZiLGcht0TIiMI8qebnn
	ImdJnyQ+KCoeryJd96ovktwAK96WtinKjVeUWGMS9gb/zkLnALAy3+KEVB9IHREA8sg0v+dlSlF
	IWYqc0EFqnt1uzcA9DOfHtY32i8Kv0nJK3UpbVj9bIEQ3sinO+9hZLWoBdEIWNWA3eeNBLOEFQ5
	h9i8kWe3PCw+wrxOtctc4A+94K5q165eLHPhhzDl48IMvXP40y0rAo/vUZfu8YsL3jFm4gltksE
	3UWDjVRGsCPcIYS8BhEGcywsZZ0nw0Jh/QRV1Q==
X-Received: by 2002:a05:600c:34d0:b0:4bb:6a5a:7839 with SMTP id 5b1f17b1804b1-4bb889428eamr328092505e9.34.1795578220699;
        Tue, 24 Nov 2026 19:43:40 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:43:40 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:42:58 +0000
Subject: [PATCH v3 02/14] dt-bindings: power: qcom,rpmpd: document the
 Halliday RPMh Power Domains
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-halliday-dts-v3-2-5c8311c0b70b@gmail.com>
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
In-Reply-To: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-usb@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-pm@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=1076;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=2tteAd38AfHrvk8Awl3RAniXNSdGBzL0LwEwE8e7LoI=;
 b=5C7/JmmmJaij3ZDCjC7taKHJ7ftfQrXNJKeux4QbuaH+Zgcx8qkDlh+sISv0oWyhLHGJ/5oZb
 fvQPpset2HKAWFH7uV37/GtdVaAFBb3EKxSiKjnd+R0Yi73lf00uJQF
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the RPMh Power Domains on the Qualcomm Halliday SoC
(SXR2250P). Its command DB has the same power domains as SM8450
(CX, EBI, GFX, LCX, LMX, MMCX, MSS, MX and MXC), so use
qcom,sm8450-rpmhpd as the fallback compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 8ee1c25a7c9d..663baae9cc64 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -82,6 +82,10 @@ properties:
           - enum:
               - qcom,maili-rpmhpd
           - const: qcom,hawi-rpmhpd
+      - items:
+          - enum:
+              - qcom,halliday-rpmhpd
+          - const: qcom,sm8450-rpmhpd
 
   '#power-domain-cells':
     const: 1

-- 
2.55.0

