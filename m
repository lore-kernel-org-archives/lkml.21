Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704508;
	b=rTf8Xvaj2UWQNhgugVuIyc/UdggzPdKeZiVsUA2umGUtc00+B7j2oBAo2pIjrFImfLrd
	 kGplt7If0jfVFK/Z3DXou1deVJ+CHQLgJ1QxbjQcCGx0fj2t4vtdVzCFN/WkcmoF4bXZF
	 njrj4u6r+ZwC4er5X1XVMxg/Q7bNJq7Et29fSymfKLMSEfsT/FLcjQYjdAmK/Zfym0QDh
	 V5KjQ+aXqeqxfMENzax1oeQLQPpsp42+kLQF1IfkgF/qWkUkKIONAMsnj1LkACTqQITZq
	 T3rhwEtVQmxlK4Z++THP7cXD2BXEyCwTEueypQBtJRayTEcCpN6QxbbdKCDDmK7QOyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704508;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=XWPS+gmFPhJ6wbrCUW9geJwH3KeH5dZUAE25L0E6YDw=;
	b=StCz8TajDFYY+ESVbtMvraVYIXCAGaIcYq7u6ejsVJgZ5I0KrVKO/i9Fao4d1ZEc68lG
	 sDhfHX7s62u0zftyMFHOlNUd8L66XbT2K5Fu6Nu3zYtzyTwHXw1/zv+dQiy32uZWkTbLs
	 Oh9BrYr7m8zWxeXY6P0QAM71H7Q3XCKmNjgOJVB4S3tDqm69jON3yiI8s8eyYYIg5NaG0
	 Jq82DanZnRyoOAmyFeWM9zHwFDEE5HXJHzvCBBHfNeUktZypIAwH8ukc/4f36e+2JcYYE
	 yWucf/BsLM1dApNpm5Xe+BODuJNpZhfu8xXPBR2ZROG1BfkGqzDIyeBvk7hr6W8px4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ABwGx9pv;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A4B606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33A4B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ABwGx9pv
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso65733225e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795704505; x=1796309305; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XWPS+gmFPhJ6wbrCUW9geJwH3KeH5dZUAE25L0E6YDw=;
        b=ABwGx9pvLpbxb2ZGqs2rnUSpyT1yijLILSwo3twU4gGruLi04NZxzL+H0w3TutX1AO
         TMNZW04/EMmFn7iEWHpWgxnUz4ML5Z6p9o5FToul/eDMONM6DatyaTOFe9DM7j94ohgT
         CJis6XGz/sfwIHoo/ZX9GDSDxzectiKtWmP216w7KwPp9OiNFP4xPBXdj3WdMEkQE791
         bfrSP32SSCkrkUcssgI2zEN+rm2E8akLIYcCu4BkWLW/KtAS+lJBMkTwIWi3p15Mltpl
         e6r70wU2zyN80sQGz7z3TfUg7lrNuCvyJzlvm0u7dE2R+cIdGbgTr8IICAO0LNyjGrwg
         5UPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704505; x=1796309305;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XWPS+gmFPhJ6wbrCUW9geJwH3KeH5dZUAE25L0E6YDw=;
        b=GZqiiRuLMk4ywNwLC4tJ0knHeJW1rzAm7WrZ/Ztuft43f3spcvhYMLEKT3AKmgaF3w
         OJueb0TfIrcOD+hLUi5KfZI17iQ2JD5VAtVk7z5nqE9fhRrJwjyI21Sr9BnTe8J83XA6
         f/KhOlH+sS+Q7G3nwjoMiTLzz3bFadnzc5TviroTTxcO99wLJuJOCPjblRxb5PCTw3wo
         F24kfj/zMu2J8tXW0I4V3hK837JEDdNhEipHJQgZju1MP3gcpliQv7TAQ2FTd+gpQ0lB
         Z4TwuJFf6Jblqi8aJ9WgocB+y0E5YRNAIl6Ji3sDaej1ejAqJF8tkhNO+HZx87cAkya+
         WXxQ==
X-Gm-Message-State: APuU4Z8wb3cFh8nSYty+zUZTGG2CDgplMwg4BY2lObTrR8Glu8kFghqG
	UXIStxVmYbKaycYKqp8FLrtx5D4FF+nRDlq4NADe2ia76YVeR5pDXs0fumzd31Kl1Uo=
X-Gm-Gg: AZFdTZdkHPusGoUAmX1/zddPdP+nKtdJ82+is3GwiYfDY99fmX8GG9iKf5fOtdhZXOR
	JoWJht0FI8MRJW/p1uDcWWSCQkP8/7xU6IYGyhs0xj6RwEMEIrmrn+cevJMmUxpEt0eV6WkBazc
	7QSg/iP86SyHsDHgb+NOQOYBRUiDumH3sLgsxzBLoH20wmsZSYkxKBkeuCX5tdnoohL6IgwFRdx
	rzcWD1ke6qHspcDA0rE1bD5nlA/8UQwCyzFpl9Yen+kVx+i6zAtSIz/X1oAPHHTWDLAJ7mFRqgG
	iCjzC6H//1LHeaoE7yxGXaZL93AwpQJM2s/L5xa7Bqf4t6JdjJiL+VhhL/JT9fmKbvT7R75/OZ8
	EAJ7o8bNx9vCx7qDFzjJyM9Tz0siXwsWbsJqq9k0gosPzQ9+7waU63q8HoHVo5zmIbUQMOOWvkt
	qKzsIzhnQV+11YbYsmaE4EEiWO73MQuZOPWJQIJT5n2xb6gLN2cOkGiEAueH20pL5ZqxwApmlTC
	RYzw2TN5G4IR5ZDwsIUwBF784SCjJ8NxYpk8YD4iLcigZET99LdGa72lJHPuTcVSTUV4y3Zdz3q
	7/vJkHBBJ7cZtkdaNPhMPKWXFI+gwd2RlrV6aa6Xh61P0p4N0Irmeff12mN/0ck8bgr/pGTFNz4
	thOcmzoAEjmEYnU0=
X-Received: by 2002:a05:600c:8b5c:b0:4bb:741d:ea0 with SMTP id 5b1f17b1804b1-4bb8880f621mr459590515e9.17.1795704505483;
        Thu, 26 Nov 2026 06:48:25 -0800 (PST)
Received: from localhost (p200300f65f19a904aae808b8a2e91502.dip0.t-ipconnect.de. [2003:f6:5f19:a904:aae8:8b8:a2e9:1502])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb9067a0e6sm294056415e9.4.2026.11.26.06.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:48:25 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: [PATCH v2 0/3] spmi: Drop struct spmi_device_id
Date: Thu, 26 Nov 2026 15:48:10 +0100
Message-ID: <cover.1795703292.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=p2tlha6Q38wBgb0Cvk79SJckBBGBy/pG4+RlgmbjaT0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrCEaqho/ac+gB+tSQ6oEF58DTYTaWOt2QE/zP0 SQiKnX5demJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawhGqgAKCRCPgPtYfRL+ ThTIB/9gvQVc9HXq2OWVShdcOVzoRSyuazUW5JkjC09KglYE14j4zdhqVQLs2shIVow2blyUzk8 hZqECIsja9/X2IfUIZGlp+iniAi5VWlLVZPPiltA/oZilkGduGezKdY7MsyktntGFFDYp3iQjWn HrZ/VvRc3cO4VzBM3Vom+9C86rxeEq63csL1LhT3Lt+hljSsTfJOkL1pW/wVuj6tzvwSrD1lvhE zg/mtlcvvsL6ObCMCm5wBovrktYNkVUy3J0S0Kc+nYuSeOSr9dkN2m6L+HK1CAOcE5b5uIMngOt vBo/WD2GrMz7+F3M5K8JnLP+Z98NewjBp2hfwjruC1W2areb
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

my v1 patch
(https://lore.kernel.org/all/20261125112158.938835-2-u.kleine-koenig@baylibre.com/)
is the same as patch #2 here, but without the first patch of this series
this results in a build failure. I kept Pawel's R-b tag I got in v1.

I'm not 100% sure, I grokked the spmi situation completely. As pointed
out in the commit description of patch #1 both driver name and device
name are proper \0-terminated strings with no theoretical length limit.
So only comparing SPMI_NAME_SIZE chars is at least strange. I think
there is no device/driver combo that needs that string comparison to
match.

All spmi devices seem to be instantiated via drivers/spmi/spmi.c from
dtb with the exception of drivers/regulator/mt6363-regulator.c.
spmi_device_add() enforces a device name in the form format("%d-%02x",
sdev->ctrl->nr, sdev->usid) and I didn't find a driver with that name.
mt6363-regulator.c does

	sdev = spmi_device_alloc(sparent->ctrl);
	dev_set_name(&sdev->dev, "%d-%02x-regulator", sdev->ctrl->nr, sdev->usid);
	device_add(&sdev->dev);

but there doesn't seem to be a matching driver for that either.

I discovered the opportunity for the 3rd patch while researching the
above details. I'm not sure about that either as
drivers/regulator/mt6363-regulator.c uses spmi_device_remove() so maybe
it should use spmi_device_add(), too? Also I didn't find the
device_put() that is needed to undo spmi_device_alloc() when the
mt6363-regulator device gets unbound.

Best regards
Uwe

Uwe Kleine-König (3):
  spmi: Don't limit device name matchin driver name on SPMI_NAME_SIZE
    chars
  spmi: Drop struct spmi_device_id
  spmi: Don't export locally used function spmi_device_add()

 drivers/spmi/spmi.c             |  6 ++----
 include/linux/device-id/spmi.h  | 17 -----------------
 include/linux/mod_devicetable.h |  1 -
 include/linux/spmi.h            |  2 --
 4 files changed, 2 insertions(+), 24 deletions(-)
 delete mode 100644 include/linux/device-id/spmi.h


base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
-- 
2.47.3

