Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795577289;
	b=rmVTjLJckUgoBkS0YmFyZsxQn1Ff3e4MeauepJAGtPjElVQOh0U021pk2zlp99y71jJV
	 CSs/RdsYk4u4QxBORtl26XbDlYtm7pqt5yLiQUytj2GR5RAxF+bTJkwfmGmCLNkIXeHD9
	 v9zB3ZEzXYWCGUvokiNRTAcEprSahM9eLICrMPB3LS4Rt1ihMbP1f5VAhJFY9X2Qmw036
	 uQUSiHiEd15iGvndqww2Vkc5ydP6Z9h07u5C0wRODnqAWTNODaoFKX7gGq1ZzxORvsker
	 EwllFQJLuLlGymo3LPnLWPfj7LZyQyD3OfPtU926umOydykMVWEwa10TshVCZQJbqiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Lq5GK581V8x7ovO5oAhOTbEGADqrrK51A5iNkY/jsEw=;
	b=1k+7QOlrNy/68JfpvzMr1qy9aK4iYmlL9MlcsXcY4GTgy3ZxwojF6d0Nx7tGlgf1geH6
	 Dut3j8wciN/mWIRa71PU2bwv/iD2i67VwVoUMHRuI/EzNCVvtrpbK1HAyrtNvIwYBjma1
	 ghmyC9HknWO4X+MvM4xa2syb2JnU0qX9MZLN+TQhNyLWlLk8TZSROXon9JoRtB1XGnvT6
	 pZYBxm4ewaSKPf7fQmu3cwrXGr2ifzPP26Zy0AJe/IW4bqq+FEnUsLs4bHj/ZpGMRTxIM
	 qMjTOS0jt+HysehvJvnIjXwIpqKEI4hG/je+X62usd9if0NpD+mEKUq3h05/UYPVn2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GAkKmFZe;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34779606A686
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34779606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GAkKmFZe
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-49a92144733so2546844f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795577287; x=1796182087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lq5GK581V8x7ovO5oAhOTbEGADqrrK51A5iNkY/jsEw=;
        b=GAkKmFZeYJdeyxoFnkh9isZrU3i6UCbsZOVdLwfB4v2LQF1h8z+4rk+iqz59bQ64dn
         8zTxsCXgxfGgbE6Bwa6Y7qsBmv+4Dxzq8/S70qdc0R9PZ0Y2uaKHghNAaCKEOExHZJiU
         POquc91sPAnlzVRSxYnsxLtXJobZNE2Fh02SJSPUWOozFb+nfxqG1QU9tdbVbhxm5Uxw
         mLqebyiqt6urRpwsv1zLryw1YaoCw4UmB2EZVv+JOO1xupHyEOnxQ/kJpbBGb27Z31Fd
         TOHDGZpnaCOvqS3bf9g7fpTTOeuvmsjLnmLXGqVHyBSXvon0XYkCUiyGwjjRuScaP8op
         infA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795577287; x=1796182087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lq5GK581V8x7ovO5oAhOTbEGADqrrK51A5iNkY/jsEw=;
        b=ESnt+f1E1vTRy8UVUBNarfQq/iXEKLltyusZa2uSskrY37fDj+wQ58JT77jxVF5ZcU
         4AfZyEOrYXjc8l+idh+hDisoksfpaGjreL371BEztFLD/pdFZy11FEA1+LrvUhEoNO5z
         zYoQC9Bc9MRXNNHsmz1LrD7qRFdgqv+1GFAF7P6FYCXJ7kyfNDS4L7q5T7WDn1fcV1ju
         F0ONzluOFAIW67ugHx5D3t1y+4W4EYuizlgQp8MYphAgIn1nlldt3Y3h3kX3dpsLtHwy
         lesBms62KpTcdzS3T4ns53Cc8fO8q97PYce77bW2ncZKp9zztGfeSF/bCNskjL/sHVke
         oTGA==
X-Forwarded-Encrypted: i=1; AL+hErEINLa7jRvJPYHji/uKVqXfMp+bxhJQ8T33MHDt0o4yNt0+CvFtHYR3jZ2uTxT7MpDfC6r/FH+WjLckmkA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4j0pjD/+/FUp7+nrwR4YhD4c3yOUVgYIfNtzTknBEZAel84gk
	3vG9u3wlZozilcdIw6G7wjkbDKS4DRuTyqK+N5RPXTzg9FxyRgchiAmwjdkM+j3PjRzWpA==
X-Gm-Gg: AZFdTZci+90D6ATFtOvElQ9YmKa9mibc8TYLkGtWnezZ/mlUI1QeZqLWQV3o4bQ4sHi
	rJMiUnG3+hjBSL9maOkzHshdDgQl5oiRaxIL+xwod/Nz/v0GvnJh5dDYBZLwnfuhOhsf+5idhuE
	Yv546ElgxbiPmDBFA+lXc8byN0kLlGhi5cgbHY/kGsD4dK0Hj+gRq5UtNX6xxji83Ex+pMZ8O2s
	7XLptBhJQQbcNmwZZY2rlm01ZxPA/1U89ZdD/7pAwlj7hmQozTbWmdQrg++dwI17JsDNzOshgRp
	qnjHY/dUdLPjLF9ywIwcL0gjJZ8LvxZZYlCS5Y7yk3nGJkxdHViOpIIoL69oFz2gXdG9pAdV/8L
	Jk2jRkmxXXfnVE/N2fVU4KNzlvdbq8gKScr9lEJOJ66bmja7X/mWYps9mUubxHizdxaLJFnoLBx
	cgp8Sc2/xRVFuFKacXz65UM4gPfh72XWdXqYD7bncvOi4mvcfVQhRcR+B9cmuSyHU3mysJTNapZ
	ggUy1VXb9js6KlBf0EdblPgruPhWw0OnsbhNjx4NxMBZZGMexSIO2UPC4/I54LDobDUIuQkHNQl
	mCbyNrR8b7OEz2lT7VAI8PoHg8DJLeX1USftaTsSzZxpLpR4/Gymr2PBKBf+lZC3+5E6A6cA6uA
	jC/xPuhBFiY+qG/e1YzaJlpHyr7OjCVM=
X-Received: by 2002:a05:6000:26d0:b0:4a6:8012:197 with SMTP id ffacd0b85a97d-4ad5d5f9320mr30278129f8f.2.1795577287400;
        Tue, 24 Nov 2026 19:28:07 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe48sm28918822f8f.23.2026.11.24.19.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:28:06 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/6] dt-bindings: arm: qcom: add LG V60 ThinQ 5G (timelm)
Date: Wed, 25 Nov 2026 04:27:57 +0100
Message-Id: <20261125032802.8460-2-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261125032802.8460-1-rofikcoga@gmail.com>
References: <20261125032802.8460-1-rofikcoga@gmail.com>
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

Document the compatible for the LG V60 ThinQ 5G (timelm), based on
the Qualcomm SM8250 platform.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1ef..85635a871e7f3 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1139,6 +1139,7 @@ properties:
 
       - items:
           - enum:
+              - lg,timelm
               - qcom,qrb5165-rb5
               - qcom,sm8250-hdk
               - qcom,sm8250-mtp
-- 
2.39.5

