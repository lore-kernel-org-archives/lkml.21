Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448407;
	b=BltK2lz0bm8q+hK4y5gblTEEwWpcOxb8EmJ1mSvl2pjQlVx/yBy7Qr1mSCknUuMzUzVK
	 l3ZKKOPbkq1N/ddBnm/qYoVENNtCsbh0yew/jrLFRV539w+iOVhEa7k7oo0sBVQpepmYN
	 RGNYEh+rZfsJwyLPLP0qCo/fCmpF8rgQU2HW2U7vbDCYxU6CDrHM2t6R+06WK2tbLn7Zy
	 XXuln1NBT6zxdoz9jt0QdaVmpKoxtX/phBXW5rljPhErBtBsIWairVYKYyS0nrFbJKM7W
	 4yOXbQWYzdKLz2NPsABbPUGOay8IqmbwuC0Ajmpwf/1gdd0lEnpTRea2bxqv7oUHkkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1SEAJCvwxTi8XMRtkX81cceNuOWvlT9PFn4ME1tNCNc=;
	b=mMvAu4D+u6xE/EEzkA8w2SM27DPABx4eN+EiRcgQ/PgGabJ5YkFDHcRoXtVRQmhsryaj
	 yOU1q6rFzBpc7g+Nse60RFHyUygUKldGljMK691NACLfjGdpGfDVY7pGrsZxsHImt0V8T
	 +2UI0CF7n1Sy1F8QL5ZS70V2xJDCd4LLfSyh2Kks247ZqZ+upi8fr1mbKPwwoN58pfgWb
	 tUmTDs02UrLeYjzyqo2wea2DyBtQGr+/n3yPIB1xnuMhHxkULZvMb31dJJIq7DzMwu2YA
	 s3/oCjGRdF5lLO6WZelUdOExZxTk7HNEq1vbREpaEU0LkaBX2GUVGJEAHUzRR/uCU+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ga7ggsym;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1491606A6AB
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:40:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1491606A6AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ga7ggsym
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso4321839c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448406; x=1796053206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1SEAJCvwxTi8XMRtkX81cceNuOWvlT9PFn4ME1tNCNc=;
        b=Ga7ggsymS6VkHSwUlv4H5Hwln7hS9KKekPYB3UukwQQfWeQrCZPK4VSH8UqtxZcTuM
         wJe6yEhFLKIGNYrulPr/wCz+z2V5NUK0a7pLr5f30VGXWhr6kh0aijjjmshphpLy/cMk
         dMbhlz7/k69ZDRJjsPxpk8Eg10ILl3LTrG0cu3leMjxE4iUoZCi1pTZPC4nqnwkvhz/N
         g42reKu3SfHvVlKWiPeI1XzYMFI7ubp5gntKSNZ8bxlJa4mQ7c79CSTDhJGTbuoStTwF
         d6XQlT0Khyk0GWKU8ynylDsTf8Z4XMq2gEYPCoP9Qzzi+Iwl2j4I3APUQQ45pKS/y2pM
         q4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448406; x=1796053206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1SEAJCvwxTi8XMRtkX81cceNuOWvlT9PFn4ME1tNCNc=;
        b=Iy7TPwS19RFDp8StoS/ZHEHZbFas8RkUKDizuz28tYLv74lRcVgswYgtLj+4jUmNmr
         4XUT5PZU0BScxnJ8yNCIZcCZTPlCmkQxqJXV0kQB4lI1NYjL8WbHLZ29oa7W3w1hpl+/
         BtUWyrf77jpgUXo0kF2d1R1nYauFJnWg+xb50HFchQF/dA7N5LWCVqP7DGhWIVwoi0Pl
         yO81YJGaVnVwB9AqEieSYMXTjRB93FtCypht7nmz1Gc+AsIfr6isQVfIxOH/q8ZvcOtV
         7Wi9hTg0MP69ABFfCvYjeol6mFx1GEI+v3w6crSsmUv0b5h07LKMIbFRaXVMN0RbFH+J
         9New==
X-Forwarded-Encrypted: i=1; AL+hErGb+gnDqQzogJlEGSggUYvW4wi0pDQfFSI1qhOGJiaDdzHqNw445Gk8IRtDLhzC6rz/4jMtx8iM9qnlCaw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9y5UfZJOfyT6faDkguL2LpaO6Ua2vya+UFP4Rzz9Yzqu+1OoZ0
	gM0hMWTlRpq8cwf6nOxblZisgB2GH5rcnlGWfLJt6u3tyxL1k4ubfOP8
X-Gm-Gg: AZFdTZfhOVML0OzgaOg5yUGkDZ4WLOr4Vohbgk2eF9xHnZEPjOTmkM83jQKJ8kbGF4U
	rqzlrlbdDr7lboVR03Og5jHDHkuIB4RaePEGpnK5/2Qkh+a8Kf8c/0dIB7thp+3BJT8xt1i2+Rl
	bTt40d4SVKeJ5TSy3ekmzOMctWrwdXywEilhzvIQK/Xkrf2vRW4yEa9uwN4qQHRG5BXkBofMnlQ
	d5CpK0a2Y9uOrb+BG09Fbr6omP1pPW/WvxaF2d4FpXCmEjpn7QlOo81cx+8haOTujTb96bRtmzR
	HML1eJUCRSsVPcZjtoot33f3BneiLhXv/2sNNl1QwSwKip0Z2qR9LY+IAB6mwYb5xWtYVnARujc
	HKpPKOdn9LXjQTQ7bVlUifGHEOeVWZ5wxAFY/KoXd4x6Rj++hXFfSRi2Cjh8FcLwcpF3N3CARre
	8aCkaGBGWSscTYZ77gh+roCmp9IiwfLWY6L0E58QkAY3JaRBaoV78CI5K8AlqTUYwDIH1+KuLT3
	xDY42juzV5AYn1KjvepkbHmU5OicbOrcll8lisAnjW9PidUjAkIUAY67dM1RReN04BOehXnTFcS
	b2CFHG56S4ei4zIvN92gbaPSenrU+2ec3vp/C6DWjIon4FoXE3cUob4rMBcOKXZMoQU2
X-Received: by 2002:a05:701a:c9c1:10b0:15e:6541:3099 with SMTP id a92af1059eb24-1b55687eb4dmr10798186c88.7.1795448405886;
        Mon, 23 Nov 2026 07:40:05 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33680067c88.7.2026.11.23.07.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:40:05 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Mehdi Djait <mehdi.djait@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/16] media: i2c: tw9900: power off the decoder on remove
Date: Mon, 23 Nov 2026 22:39:23 +0700
Message-Id: <20261123153927.2547169-13-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123153927.2547169-1-congnt264@gmail.com>
References: <20261123153927.2547169-1-congnt264@gmail.com>
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

tw9900_probe() ends with the device runtime suspended, and
tw9900_s_stream() takes a runtime PM reference with
pm_runtime_resume_and_get() when streaming starts and drops it when
streaming stops. tw9900_remove() only calls pm_runtime_disable(), which
does not run the runtime suspend callback, so a device that is still
runtime active when the driver is unbound can keep its regulator enabled
and its reset line released.

After disabling runtime PM, call tw9900_runtime_suspend() if the device
is not runtime suspended, and set the runtime PM status to suspended.
This has to happen before the mutex is destroyed, as the callback takes
it.

This issue was found by auditing the driver with an LLM coding assistant.

Fixes: 918b14a26b12 ("media: i2c: Introduce a driver for the Techwell TW9900 decoder")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/tw9900.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index 51db5d5ddbde..1baf55ea48ef 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -744,6 +744,10 @@ static void tw9900_remove(struct i2c_client *client)
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 
 	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev)) {
+		tw9900_runtime_suspend(&client->dev);
+		pm_runtime_set_suspended(&client->dev);
+	}
 
 	mutex_destroy(&tw9900->mutex);
 }
-- 
2.25.1

