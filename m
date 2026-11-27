Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786773;
	b=tl5QwEAeK0c+1UGfsQ1wCOt68CKWHLB1qWt+1h+Pd4B2U3RdAyv4VHVlEMRPV+BTwPey
	 q+iDTsK7IgK/XNtYX7w8YM5hfh7EJZqn+t38eNj1J6UPcnO+7sYj9PYPJfnrRLfHw0Z6B
	 hBWATvoLM845sOUsiynF6YrqpATzttcrDInSHbXus0dex5JRgfiSAp/sWGZRef6ygk6ni
	 zryZ8jSqtoFW21ffH7I0yr18V+gSMydJKqhWZPnjOgn/+6aC1DhiLQnJAMjrfEQwFrxgk
	 G8c7vseGbzHSC8c9/B90JdbZmdILifeaAj+2z5HuaR9MyCEhx0Dahso49/MNMLby/4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bbrug+8uKkbzVoFqJqWI8dq/qGO3e+q/IPCRmFGAqNI=;
	b=mQcGwnwtW43zG1+ZNEIrp9do2yM1WP4Dg0boreFpUcXz6P+HzEUOJcVXF6H2XBpRM0Ym
	 0I+v4YrBjyZnx9BFV91R2/4GnQX0NRRxg5fX8RN3o1rjE95Oyf3OwGjWKYhcd4n5cy66R
	 4TE0ZatFz+prbNPcjXpMKyaDVYkSSFTJHZsMnLy0aiVpc2GIr3xxkAMhQ69ZC4PjuOKT1
	 99VE6l+Fac4kgB2eTMhJ4gi9rZo3PM4/qHjiNOIDlJCFkWMsevl050YR70aIhDHEuLX4e
	 dT2jwZ30rKl5DMKuPWD9pg1xvlg+gUW2kdnmFgesyHzCcVSDVMBW7Z+rw87jc61p9hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vk6aXdWt;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DA4606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8DA4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vk6aXdWt
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc751eddf25so5142640a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795786772; x=1796391572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bbrug+8uKkbzVoFqJqWI8dq/qGO3e+q/IPCRmFGAqNI=;
        b=vk6aXdWtZcOv9SDjgZo4aPtSXjHP+dsUNhFVOzVRoNkFMMlK1+gEIxnD8+v1GAAPAZ
         MnbHdlAcYmLOKYH6qIbCT5mhbo4d0UTu+opmk0LMaiOD58JEmx95bcBx0SRjUbGre9bD
         /eMJmucK2v+fsBny/hJogbM5zuoJZKda8VmGMi1YPY13CZlqd+arejoMq/kG2ac2MLXk
         vOraqGsFLkLW/+3ORXJIvlRIgXE6IG3CRJJx9ZnqT2V+VdoVLQLmHCfi+S3mXuhqOWKV
         JAFvTYdwGcCEh5GfPRiCiXi0tc1Qak0fVRNnDBz77gyM6W0DoSWxRl3God8MsyC6yRM3
         2L+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795786772; x=1796391572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bbrug+8uKkbzVoFqJqWI8dq/qGO3e+q/IPCRmFGAqNI=;
        b=wSDzLoAkhkv+RyEeDD+OwS4vSnx1W34+6BsSCRnISk7aGKsSlAiecDXxaVpNvutGB5
         JpMUlArJ9SUy5mF/O9U9NEjAnf8WhY/pCgcm/oOsFudc+kQ4cZ7pJzagyAvNsi821063
         eCej9cnpOnJGZcAwAh/JI3KTjsVwN7dBk68N0/53Rj0y0wfFzUYrYs/GQs4p3R6oSyt3
         cP+DGhIoM0iFGecN1kB2YDxYHYm+CmO9K6MvbVp6p8THwYSt8XqEkzJAyDl49eLIDNKT
         zwKKMV3eDSu5P/3QF2tLmB7ditDP5ETmdo1OaiBmNLMbVicMAsRAcU3B4bXj3pcbhiql
         qoJg==
X-Forwarded-Encrypted: i=1; AL+hErG5iamxXI6JXCzdd66ePx51+eV3FkopvTgiQU7HNZy1u0Y+RgJlS8HMkWgAA5VSoiV3jh7ycR2t1MH4QVA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8F7INpGCHGKtKzSmgoNch+OB1n9dCK0nPxHK2v8tSEbk8xnevq
	nQnlXiSb5QJk/VM6XSOoVBOHf8ZOWHwsfwHPsXVl9z9IwEemsi5GFLbk
X-Gm-Gg: AZFdTZf7kbpJ48II6ycJKzeCi4rrICSTr40g2i2Is4RuRFBA4vUAVWtX3sL1HkvzGBr
	WIKrPZicydnf4Mb3GA8O2xJHxa33Z96cQyIsCrZoUHvrTzBScRdoOrK5ui2TExtr6OV1jpkyz5M
	nr/EvdNq35q+hnvShv0JJColZRQyKkoQ1nx0lLLUkC4szR3iyQLSqGNXjpfaL5xTl27j0XEoT1l
	EwSh+OfdPmamk90HeABvoVOmqy5UfHi/dxpxRlhDCGcCX3zb/fGacWv0Wq85tGhnlq96AvymXiB
	84YuTTzeUCn9IhPmzRbEdaRUk45nej4Y0NY6pPw4/OpdjKuunAIdUEyXI+HxEawOKbSgXpnXEOp
	i2DjSth/2FDaom8/VGpadu/BIRPuhjYSWa8q3TGVti749aAbTS8qEur+J4XILRpvqeaQDu1H2KD
	oWXZI067YMHxRAPWbKqLgqwpe5xaOs0fVynjm+uCSEiaNG7CkDXgsPosle7nnEWR5lGbHcr6znN
	nLzGIG9RZJ9zFuZIW/Nl1MkAOQB+aQnJ7WW2p6H5+CRnt9h8Uj06BGUZxFhkAjEXMea1P/Abuc/
	2lmFyfCwhEbCNhRL5JCh1SJ150a7kDuw8trRNM03jjXRtFIEw0DjnPVndJo2FrK9rdVgHsG/wZn
	JX/hk/f0B2ssjrpO+hMSC1kdiqR/V2nVGaHmZEZyHbCrVEsCLYc6DB3+FUkwm8LqR8gL7CIXcgh
	rOPwT2Od8ZHEeXwbvm1r/3e1zwd5nNqhY+u8D8Ljc=
X-Received: by 2002:a05:6a20:cc0b:b0:400:a999:d213 with SMTP id adf61e73a8af0-4014c25005fmr27758378637.23.1795786772137;
        Fri, 27 Nov 2026 05:39:32 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-18-138-229-8.ap-southeast-1.compute.amazonaws.com. [18.138.229.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdebb45c972sm4091144a12.20.2026.11.27.05.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:39:31 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] usb: phy: twl6030: fix comparator init order and teardown cleanup
Date: Fri, 27 Nov 2026 21:39:21 +0800
Message-ID: <20261127133923.1452-1-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
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

Hi Greg,

This v2 series addresses your review feedback on v1:
- Drop the unnecessary comment in twl6030_usb_probe().
- Split the v1 patch into two single-purpose patches:
  1/2 initializes twl->lock and work items before registering the
      comparator with omap_usb2_set_comparator().
  2/2 clears the comparator via omap_usb2_set_comparator(NULL) and
      cancels set_vbus_work on probe failure paths and in
      twl6030_usb_remove().

Note on drivers/phy/ti/phy-omap-usb2.c:
Automated review pointed out that omap_usb2_set_comparator() and its
comparator readers in drivers/phy/ti/phy-omap-usb2.c do not currently
synchronize concurrent updates to phy->comparator. Fixing that requires
adding synchronization in the TI PHY driver (a separate subsystem);
this series focuses on fixing the initialization ordering and missing
unregistration bugs in phy-twl6030-usb.c.

Bin Luo (University of Electronic Science and Technology of China) (2):
  usb: phy: twl6030: initialize lock and work before registering
    comparator
  usb: phy: twl6030: clear comparator on probe failure and remove

 drivers/usb/phy/phy-twl6030-usb.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

-- 
2.43.0
