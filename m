Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795884053;
	b=WahQm/sCnVaeoP5pALJwOY+JD5W1ECXUzlkcSBVyL4q3yrFTOrCvMsUZP82kDyFa0QU/
	 MYPi5BtlqETuUvwSa3ae6EDko5RFXj9AvrExiut67UMPxYcDMP8vyC752rEO1mEt9ek9c
	 iGN46PoC/71l84Jw9fm09KC7oX/xG9gvwrpjxwYkOzrYGb/Wld1Mv6ofe3l/npwEtkT+2
	 APWGdEJbqWMfobMcMcdp6lgQWI1OQATFsTmIZTuGD1mX9YxhcqWxMM3kW/FeS9d7cSTTf
	 hu/Nnb4dpJqV6J2G1yiTb+UPjZPSrJ0nggPocBBcRnfz9j8s7vFWwGR8r6VP79FL6yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795884053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gqwCM20e4thss97/NymCbPz7xvyJvWhci3TE5KcOvpk=;
	b=deDs2GTQ/ZOBbswN/qDBBLbqcwNIRwQ0jUYyVMXSbt1gm3syQfhwalFDbAUV0aDIitSU
	 NKFFU9tQTfrbKJ5Muj4/MIbRD1Y5UHBPxC3p2tViyGfvCeqSM3CKcN2Ifqavvpib9PiqC
	 ZVq8zZaxhh2G5sTG5bSgbjzl8Kr/RrfcxXEkw2BrvL7Incs4yqSvXJPOV04Jgz+nzKLkA
	 jGGlqx1cgs//O28iypC1oeHfK+/M8FjcpKfAinAdTG4Bu9Mh/tWbwIk+GbCPm6knfVdhS
	 fiK6C3EdqEI0TvBnsRsz+2k7sncNlNoDgc3DALsHkbDAUQ+w2hl/mJF9PhSP+oxU2tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LFwOe+mq;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601F0606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 16:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 601F0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LFwOe+mq
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-386ab9ab619so12939326eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795884052; x=1796488852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gqwCM20e4thss97/NymCbPz7xvyJvWhci3TE5KcOvpk=;
        b=LFwOe+mqJyYywv7FAiqfjH5o8OKh5Tr65bsRwzCBOn0okmlUCMllB7yKRA9hTaS5t4
         mnBJrr0lVIRT6kwhDPGWWdBgEXtV5t9hIfaHwRPXOFDb2N3opjxKF3wD+FTb++qMa+g/
         3KkjzBsOdtdP5qsSCWcHuT602o+gKOA46fHAut7P3+eNkfpJ+4DCQjfWDSa4YQHa5cy8
         ZLfErxv3efWT8I1Wjz7bTdQYaP/ydiGP3+JQjohIOVsfnD1M/Y6tMpm/6uchJbm9QP6y
         6NQv/lTQ2dclw4qLE4xnl8IfLy3zR8yRn1JMTUXB3eS5JIloxuVsPYTLSWbqHu4T6gTD
         4xqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795884052; x=1796488852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gqwCM20e4thss97/NymCbPz7xvyJvWhci3TE5KcOvpk=;
        b=MBOkhekNZ5S7Fs6i0ZVn5RXIf1bK926kkbsUvgMyLZ93V7+Q4JSg8Eq303N0rDTTwk
         ZeXTHvrjQ/oNMlzc1r+b9MrUFzK/U6yEuGNlGTpMkWn93AO5KlTGrgfPvoqRUHlI1N7o
         LDHegjsraauMVKwquyydk6faV2SGLc0aRbDN7LHBXwH2kOGhw3r9dLQrIQefis0puiSR
         T0Cc1fKDhjgX69Ko01mMtZ3gDWpaOBEZHQ6MvHr/DkBuVjcuiVrWeNOkan51BNWRAccS
         G0+hLRktOImuD6sOjtjnv1VNQr0r7OKO4vE0GS9NxihrHFgTMJl6RPTm0lmWe3g8QWZa
         +rNw==
X-Forwarded-Encrypted: i=1; AL+hErGaIB2Km7O4/xoG2W4lcvU+MJiDUMD00gJPAvi4jJd0M7Q+O5ZqMU2x4Dbt9HIU/Ls0wE7Vqm6TAWKnq4E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QXy5s1WfO5qJ0zisSTJItgTJv9tnp0N8Q0AB/UQjL7OvA2GfX
	rzqdBKsEFn5qHDkIH2eRmkMtX0jkNmZtvMItP3lTiLkvrDiIIU8dLnBJ
X-Gm-Gg: AZFdTZef+HpRD8oh+8zeIsRrEbmfJciJrOAeoxwvtbEnPRuvHXWoKt+wUBpX/MDDeHb
	MWSp1SA7wfxGm6BsIlAFt22StC1fNdGyMAXtQ1hx7PHCoGZLTdf+GXI4fMWGSJisgYpNYjqMjJV
	QH125ibB5KbKnTOfojHC9IQOYs+GHmtYszXxaiKQjsB2JH/KKa8o8RuJ65pzzwlQfLKCXLpzUJ1
	h28/8SszyKoy8YuTsdQi9edwTaNpOuT0BLsg5fM0K6wHjQxTTUALhJJr8FrMbhOAz/QDyY0xwm6
	J/G7wQQohE0ezX4ZZeB1djYZouseBvNSiT45Ecw42iWuHlAH3OT8vtNNPw4Mb+/h2uTo2AeNuQN
	ELEJgAnOnfcjlhFK+bmdH1mEfvpJct+Z3VKGAgpCNqJ9d50Wwwcl4K0CdtsHn6JzdNNhEPk6mDr
	9SYNoqsFPf2H4L8aZMV4c5R0bTNeburd2+m7WIWUIRvr41Qf84l+D24CtdDkZ/V0nWwkjWpBu6l
	lUby2uSLf+10oYPLJu+8RtHOVQq1AZvCueu2hDkKo9RDzx112L4l09t6E+GBRs8GhkVU4XblgGi
	e9kd5i8Aa0Hpj+sK9m4omhlGxNUwqXsl0sR+ac3ywDwUats=
X-Received: by 2002:a05:7301:4d11:b0:386:c666:ec45 with SMTP id 5a478bee46e88-386c666eeb2mr12276045eec.12.1795884052525;
        Sat, 28 Nov 2026 08:40:52 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm93606966eec.21.2026.11.28.08.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:40:52 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: qcom-labibb: print the real error when registration fails
Date: Sat, 28 Nov 2026 23:40:47 +0700
Message-Id: <20261128164047.1831945-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
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

When devm_regulator_register() fails, the error message prints ret, but
ret is not set from the registration result. It still holds 0 from the
earlier regmap_read() or devm_request_threaded_irq() call, so the log
says "error registering lab : 0" while probe returns the real error.

Set ret from PTR_ERR() before the message and return it.

Fixes: 498ab2fdf855 ("regulator: qcom: Add labibb driver")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/regulator/qcom-labibb-regulator.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
index 8641e69b55c3..e23f29fd6cc7 100644
--- a/drivers/regulator/qcom-labibb-regulator.c
+++ b/drivers/regulator/qcom-labibb-regulator.c
@@ -872,9 +872,10 @@ static int qcom_labibb_regulator_probe(struct platform_device *pdev)
 							&cfg);
 
 		if (IS_ERR(vreg->rdev)) {
+			ret = PTR_ERR(vreg->rdev);
 			dev_err(dev, "qcom_labibb: error registering %s : %d\n",
 					reg_data->name, ret);
-			return PTR_ERR(vreg->rdev);
+			return ret;
 		}
 
 		ret = devm_request_threaded_irq(vreg->dev, vreg->sc_irq, NULL,
-- 
2.25.1

