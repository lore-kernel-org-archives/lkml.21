Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795041471;
	b=YVvPvMw+avzkOCn+sAEJzE3kLalcIASVHYKz24tl0B+HNeX7cS+fzwLsqIWfKS+k4eNb
	 h0H2JFvBenuMEYigJsS6PWWQTtWm73i2aEOPCFwgFxUlrX2d9FJ4uI8xUkkpXqRpOKiOI
	 qxfJf8uLwR99ZsqcEYm7aF9VxHV/Ez2hYTquGqQTmB5Ubw8t0j6n6gYc5rIkfqdxivSGY
	 jMclcehIwcqqZjDaUGU/5Bet4ypJkZEgtdHBeEKJ5Fh8Aftqq+XjOwk5dFNxqXyHzG6TY
	 G1vy52YdmkhOPFFV19MLgftPvdSNCC9squsoPw2vxMGWZxellNx9Xwxct/LHUxIez1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795041471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xJNIC+XAAVcr/CztaFeU02IRxIHoFPYFIKJwLxr6OIU=;
	b=FcBjJ6PuQxVc88WFd47HF2oI0kyv7O63SW3Q/lBiVx5MWnWdWDA1t4YOFiucJqejDiSp
	 U8i599W6wrtsoSvD03l6Zf5ngdVAopdLsvWDTwdqerGjPuXkiHgWD8yfeAGR0F8GFDa+h
	 ToibkHwspuZ1z7uJLZ/VNcPfkggrKCe3FyH4KK69VaTwZ69uoj499Q5yXTTyp0VihQmy8
	 ho1v/kmZB70O5EhVUdlpurhxByl63D4FD5QjPnha1vlcdlhNg9yi/M0/Zbxm9oig+Mdz7
	 Bb7aVU7WcEEjAAVAO5vdQrW0tR59OlD7pVqIg3IvKGq2PrFbdvAzs7X9ZO3RfKHNMfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LQTv85WR;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A9660A5BD0
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9A9660A5BD0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LQTv85WR
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-8629fc8ad64so876096a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795041470; x=1795646270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xJNIC+XAAVcr/CztaFeU02IRxIHoFPYFIKJwLxr6OIU=;
        b=LQTv85WRHO4T3nNzY18rtF44XpGsvKWtAxXELAqXUFBdlGVOcN3cn2vDIs7fvN/UKT
         5FfKbJGN41hT/j/Srk4RieQbOswkDQek6vTWomW6tOAbfb2wHxZ111EO10gJY69K9eVV
         13uJjpQX0lGWh+k6K5S0Is/eRsm1jqJAY5cpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795041470; x=1795646270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xJNIC+XAAVcr/CztaFeU02IRxIHoFPYFIKJwLxr6OIU=;
        b=OAiAK38+1ZZcyR7aYnVzkcDRHxr+DRQ19bG3gsQVka9Kg0YXswVNU9arKpWBbX94eP
         7KmyIxiYO+XxyyfxlJ3T82FzFL40elkgX+6dOuadrpoUdo5Uz5Txh898Ntx2BQogGQve
         qMKuF83avgnYL4A1wFAc6d+O3NdQu7nWqahDvQyQpJHd8X4xdNJbH2nNbimroLASb0XF
         9NZEI2WkXYbWJhUoxdEhriGy8wqDazdBtiVIsBIuZo7pS6QMzdY8t0lyMeAlacEQc0fX
         mHEF1wBFz0+lWr5M8YEc2+BOvmqcSjbaWKy/s4uEfcr70FuSYLAr+aWDMqEkMtxZIagg
         zsKA==
X-Gm-Message-State: APuU4Z+H8SyYSPNQgIBpZ1qvJg2SjbC+H+FrYXGHWAokT09PMssUN+ga
	fUkEnbG6dcUG+4hzb1rQyG9I0rCHSi/H9ION93bAuzkHNXomdQul40cAQCrBp/+OAQ==
X-Gm-Gg: AYBFou3cTXWqNp7CLGoEE7Lk8TZNjhJGo6Voen8fYeUizmhlDYfP4uuDVI5JUlRtFqa
	dCvxQ+3auq7w5Zt1/QtJdta7jU7UgFpQ1vuFSTsTT2mXqOGgTpMKcGIHyAFJFSSfGcSrNDEBgH2
	+yJ2kqlry6aKxrtvT7cLw8p1hjr+CzjnkZSJKk2nl/BHna6gpaDK5qLzY17TRHoX/T/eBAK8048
	5xd71sHAaZw/H2/tHMkKabJvOb7V3WNw/ZeKIbDzFKobMT+Fm+ru3OoEzrnIyJgATPFFsiyObhJ
	XLn5T3hzXXhArol4RolHVrlcJrEjGkTs0UQ6U3htwfpSOjv/fNzR/UnMC/1TSrsABBKoMol1jts
	m90yK5iIosVaRw3gCSICR+ePoZLNKBETd0+d1BUeWo18aMEMAY24MlPh+uSG9AGq7VSW4hl3X7B
	ABt/tGK8UYYzVEZNlecYX3wYzuHICFJ+BGRP8Vhl1MnBBfuDdeebQ0709oE9yQRXqSnQMwuuWYW
	PTEnYjWVGI96F88JwriaqmtwpX3Cd+YFspZ8sQXl9EusJDuy+1DGvqcIYLc30j/Fb84UVN4JOef
	5hX7yybgtIiO2FRjrgz6TGXrSd1diwq/unXQW1gVNcuXyfmVfPROXZGSz3GNyXTKzAxbM2yGC9Y
	y
X-Received: by 2002:a05:6830:a159:20b0:81e:b506:592d with SMTP id 46e09a7af769-862f08c9cf4mr3177128a34.27.1795041469735;
        Wed, 18 Nov 2026 14:37:49 -0800 (PST)
Received: from rrangel.c.googlers.com.com (212.56.236.23.bc.googleusercontent.com. [23.236.56.212])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f01d4737sm2948762a34.7.2026.11.18.14.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 14:37:49 -0800 (PST)
From: Raul E Rangel <rrangel@chromium.org>
To: Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>
Cc: linux-kernel@vger.kernel.org,
	Raul E Rangel <rrangel@chromium.org>
Subject: [PATCH 1/2] pstore/ram: Clear *prz on persistent_ram_new() failure
Date: Wed, 18 Nov 2026 15:37:45 -0700
Message-ID: <20261118223746.2251358-2-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261118223746.2251358-1-rrangel@chromium.org>
References: <20261118223746.2251358-1-rrangel@chromium.org>
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

If persistent_ram_new() fails in ramoops_init_prz(), *prz is left
holding an ERR_PTR while ramoops_probe() jumps to fail_init and calls
persistent_ram_free(), which only checks for NULL and crashes
dereferencing the error pointer.

Clear *prz on persistent_ram_new() failure before returning the error.

Fixes: 3219122b8cdd ("pstore/ram: Consolidate kfree() paths")
Signed-off-by: Raul E Rangel <rrangel@chromium.org>
---

 fs/pstore/ram.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
index 2eb0d4fa2186..aa056d0395a4 100644
--- a/fs/pstore/ram.c
+++ b/fs/pstore/ram.c
@@ -604,6 +604,7 @@ static int ramoops_init_prz(const char *name,
 	if (IS_ERR(*prz)) {
 		int err = PTR_ERR(*prz);
 
+		*prz = NULL;
 		dev_err(dev, "failed to request %s mem region (0x%zx@0x%llx): %d\n",
 			name, sz, (unsigned long long)*paddr, err);
 		return err;
-- 
2.56.1.708.g77570a6a1d-goog

