Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098229;
	b=qtgzVRefe2CLI8zrmxMP6bzaUboQgDJakYz1KvdmwHKadK2XkJgKhldjJ35Ixds/7Eh3
	 vjj0uFioz9GPKcvRast4IlBsamdS4htDiQ8hNiS8vn9mbTwe+zlQQxi0X3VtABVvVJ8M2
	 gbpNiAOhAVVgC5SvE0UonOo2mahcyeIbZ6WemjfPMbKaB7IGrq+T/y1TBNv5gvyD30LpU
	 09BxUXFbEjPen63VR0TO2YSbkPMjYYG0+kalBYEFIy3Y6NasXSrXv2aJd8TwzbQm5oJmT
	 6hwEatC4p7RUtbhUU5ED6rJdUsVV4kr77qAALF2kMuTb4vAgiVRnMSIUPNMv6ATusqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=t9bWB+Ike65eic+Yy4cT8z9+HxhXkL0til5+GubOeaM=;
	b=yHln6bLoMfe21ngB5wFdBPfVWyx0HvfmQY+QlJndVRTEKVAwHoZG44MRlcerKbXxl1X+
	 OK1ku6phaUavwt/ZaK7EpTf5q69PqXtODt7nJJzj2qJt5mAwlvyA6jVXph9lJsGfk7TdH
	 AeHoFacaE3LT8QRYzEdMQuShhjjPZzA+y7iuRaEkPQruEoCeRDeiaSp4feCaOBj85nyLZ
	 GF0D6HNrwTatsn7s0Dl4L5tAkArwVwLYK0XoXLP70fjI9C8XS4kxWMlFPhQwM80FoHEY7
	 0OV+MA0ZgbFKpfmPYdJ5doawDrWjyzCxHnJPhVqugJaFmULR45osxuUyTDP4NEv6ivw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RakDrLwK;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4A2606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B4A2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RakDrLwK
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f02f04a426so5263765ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795098228; x=1795703028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t9bWB+Ike65eic+Yy4cT8z9+HxhXkL0til5+GubOeaM=;
        b=RakDrLwKnpFkXQ5x53xU+/JtMeb5PKs/XkG/jGg4XUbPrV73tNZs5tZHokm+sjHSaD
         R53c42cI3ZAqLjcvQeKkxZnMlquo2wkjbjqxPk/+SGxCsClwm9WbYqtlckHmdAMLAW/W
         sCiIayoTguztq+/dzFAq47t/Wgeni9PqjkfBR/GKPGF1vnphVLQ9OSbymwte1rXoSaNM
         SoSH6cEG/+tzOQwWZDOZVZXJKYCAEGrndvMQdcryCRTXj0asVWvOO0gIYKrjdEZhARPY
         FJ5yFBp4vC7QWuTfm2RHldZSJvR1Eo78YqbRmFO191CVsS3RVXrql2nTN/cbG/6WKic9
         Sx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795098228; x=1795703028;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9bWB+Ike65eic+Yy4cT8z9+HxhXkL0til5+GubOeaM=;
        b=bfMyAVl+AlqebCb3GQM/67zpa58KMrXIO8VAGvEQJe7K8XTTcOJ+f/CJhUBGGbz54g
         W3UtEPyY7ng1zFiiLO/4HrQNRUuGygC+u+j/6JaUl6IfpSm+fq9v/8EmmhgeivtI4VWY
         Mbns8ErU58ex2XV6VnomUHdg1Iw3AnD3JC9m8h50q/Nw5SFUqjkf00aU758H+NjTjrao
         Rn+wH40bm1+KKn51gRTCi9DEZF7j7XAjluieXROaC/3WoX7qTo5UMJXbRpsD9MprqOiD
         ffnpwNILuULebXQUl3Rd8n3BCVuo2uN6gqxZD2/3escwKtz+yLDUa2mJ0jbacltrWbpU
         uZYw==
X-Forwarded-Encrypted: i=1; AL+hErEbj+keaqIB0veiHE3nTumQ3x8BBwpNanBVlRQb4eykR7OogtRI0DrAyhuzQIkDM7xHEjYttNp0e1s/28s=@vger.kernel.org
X-Gm-Message-State: APuU4Z88DxWlREplfmtH7C0CC/775kklnry3ZrvIuzJXjDPBteAskDWA
	soYPmNxwz8rzpt2pTSlCXvw9kKT7khJVsJ3e23Fxr3ym44/l70+t0krV
X-Gm-Gg: AZFdTZefdSyCokxfL1Uhru5EFl808B0kgJEb6mKkfPubC4kX9X7PuSaU6Ilrw5UHEeB
	t4xVMlg069pcHaqxr20i2GwqDWY+fgTeCuPbee8pcITmKcjYw8g1sb+NP1euDL4sm1Ysvlse0S+
	yik4xTI5Q+G9oHUUt7Lk5NBNZa/Np8U79sgctB2V4PTqcKU0dH8yaoGdunNVK3E6nqii+Qn/X6K
	ghvl8E/P0ncTGI/bjGZFm8Qu6dyhNcKvER9DNRgejM7xKZPmfnrz6KdLBTqpG4vObrPCAYu5k7V
	CmDAWcB4JhptEyCktpkP5JkJc+qTrm7zLfJtDtUQRSbp4D5sd4rQzaeC09Gel/iZeEsqr7RqpM2
	I2S2ut4sgqSSK9IvbN6yn47ynSHvNVasXnCvM95h3ZPDCGkFG/4UbKBc3stgpt9/I6sqROVcKdn
	S+yct1z/g9n/3oW7eE5oDwUV+1m0XtXgki51eUUM5fOSDr6TpRZSfaB9nFdWoGMc7zdzRBAyppT
	hZe3HdlqjW77O0qMT+FncBeICvsiNwVxlMX3I5U/L13v4aP61o68xMt2QcrErNzX+1Lsd0UzWfc
	t/qnnAmbwPq+MloWU8S3nHcD6z3KkEKBY44=
X-Received: by 2002:a17:903:244f:b0:2ef:ee39:5dbb with SMTP id d9443c01a7336-2eff754e579mr60705635ad.61.1795098228295;
        Thu, 19 Nov 2026 06:23:48 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:11e:f696:8454:757])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f10e67csm164415ad.53.2026.11.19.06.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:23:47 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: Re: [PATCH RFC 4/5] wifi: ath12k: Support MAC address from the firmware node
Date: Thu, 19 Nov 2026 23:23:41 +0900
Message-ID: <20261119142342.2063-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261014-b4-nvmem-efivar-v1-4-187c85f65018@oss.qualcomm.com>
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com> <20261014-b4-nvmem-efivar-v1-4-187c85f65018@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit

On Wed, 14 Oct 2026, Abel Vesa wrote:
> Read a MAC address from the device's firmware node (a DT "mac-address"/
> "local-mac-address" property, or an nvmem cell named "mac-address" via
> device_get_mac_address()), and use it in preference to the address from
> the firmware board data.

Another user for this: the Lenovo Y700 Gen 5 tablet (TB323FU,
Kaanapali) has a WCN7860 on PCIe, and its firmware reports a new
00:03:7f:xx:xx:xx address in the WMI ready event on every boot. Network
profiles bound to the permanent address stop matching after a restart.
The factory address is only in a file on the Android persist partition,
which the vendor stack passes to the firmware over QMI, and the
bootloader puts no address in the device tree. So on this board a fixed
local-mac-address is only good for testing; a per-device source would
still be needed.

I tested this patch on v7.3 with three changes for Sashiko's review [1]:
the return value of device_get_mac_address() decides whether the
address is used, the buffer is __aligned(2), and with more than one
radio SET_IEEE80211_PERM_ADDR() also takes the firmware node address
instead of ab->mac_addr. With local-mac-address in the wifi@0 node, the
permanent address came from it and Wi-Fi connected as before.

The cover letter says this patch is only an illustration. Do you plan
to send it on its own? If so, with those changes (and the comments
dropped as Paul asked), feel free to add:

Tested-by: Joonhoe Kim <26rote@gmail.com> # Lenovo Y700 Gen 5 (WCN7860)

qcom,ath12k.yaml has additionalProperties: false, so it would need to
allow nvmem-cells/nvmem-cell-names (as used in 5/5) and
local-mac-address/mac-address as well.

[1] https://lore.kernel.org/all/sashiko-outbox-171329@kernel.org/

Thanks,
Joonhoe Kim
