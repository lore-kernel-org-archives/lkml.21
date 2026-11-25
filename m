Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620148;
	b=d8lTj3kLeizmnn9MxdV6ITZ2r0QG4aMxQXnzNlXDafglseCOifrSQRdedaYoPwKk6Nmf
	 2Wlu32HzueD963wAivY4KFsRyID8evKy5p9Hilc1FqZZ3u5qm+WTKWujb2lYoD+JpZwEI
	 vES0Pb0pq/FIv60bGHuyTSCkomMao7mxG/dMWbLtPjKhjiZJoH0uT0hZnb2ejZs0PGP9K
	 SwRt9klPUhUsPAzacKpfwxiXpbbIDhoRns/dBwl8cydHHwBtKKdZb5Fy6568mA6yGRSm5
	 hgoRIbxh/H4b6AdZKX21Gzp+S1ekvKYqEYe+xapSQ6UwSn5U/SfWhbdpRUv29cGBgMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZOVH7GPrhhsO60hstl6R1o81Xncu0EyH/gOszIASMlQ=;
	b=t2aCfBTqjwzl3h3J2JHMCAYvGV1YqxSOMD2Hj9RfNZGfn+6mo8CXQ3sIcYLCJd6xUrYp
	 yGxjmKzw75/ssdTqLN+YVwWc0f78g6c4LOgVrwjCZEsHfrxhtPcxm8vO2vlmfgzC5AtR4
	 lvhSDBI8eEScd5n+dxRBHxnxyZbWailuN9kC4Qxyh3+k1PTzfTKXcUKdjpSIQy3J1nNrF
	 6ueLJKQtpAZT8iE3vvaUQeiY3OWC2FKo9rYvEwYy9lQcUCpjSp+9iNVAOneHUWUPMa68G
	 2m192jWu90DateJDGK8mHhmdmKXSbhCBhC2C6m8IqpLcuizKA781bQkQ9wRGIwciGpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jPmkv8Pe;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BB9606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8BB9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jPmkv8Pe
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8ca6a12efd9so1887949b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795620147; x=1796224947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZOVH7GPrhhsO60hstl6R1o81Xncu0EyH/gOszIASMlQ=;
        b=jPmkv8PesLa4C6zoxhIKZOfN+riZ7aay+ijRUaAeWqiffleQuxgF/xyzsGymgLXQ2K
         c2EIOTlZARL2nWO4NDlS5KFLUVw+8/R7GZ/99j8y/7nkSm3U6D60u3omHxRTyvqLImXg
         JPQJjTY71Ss1hSVM7QAe9o7JPiDdmK3mXaGjuyAfvk3Quvf5oAarmN/IvIovCNY728Jw
         f6dvv27kIOTWl/E293jgTa6mkda13TdnSLRd1mG97MZYZDzpox0CNTCoTcCW6aSG95kt
         yAyQ5Tg/CfVRuTFBT5wrGq5LQgvLFvaqQmpgr8lcIK1Rp0r4Pz06lluw6RYeoV9ApWO7
         q6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620147; x=1796224947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZOVH7GPrhhsO60hstl6R1o81Xncu0EyH/gOszIASMlQ=;
        b=eHxFNlAt9rPAieCevhbxx1zWJyAkZkwUDvgQPq8p4XBbpDrDElZrHbahV5MdBhM9ul
         hye2ngxuStEW7tcxhkBJ4VeAhSOqc0pDYINa4IoB1SWGXFzsEmp1laSWvaZEZrXx4zO5
         3nWf4XKml0FtTGO0BjR2upof64wlqrrz8XPuEL2aUAytjXBm3CP/f2LzBbQjzC4ZgPET
         TCJejovXwHXmF8PMxFUJzPPgZBptyRgVC3h6bxonYDq4Ra9Sf5pls3dc4tDdsZMNHZRA
         TfxscfJeLeLdJmXRUBpeAt/XOm/USmTZpjO1QLYWvDZV3inaauVxi8G0e+sXLV+XV419
         gxPg==
X-Forwarded-Encrypted: i=1; AL+hErHpPVbXza+78Uwk4sGFfKUFLphAS3ELJr4dYGBvs7fIespHasT9fwQpe06P61tynix9luimN9lCMOFjA9o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yRCO/R8QE785lGwHss68pln9B6lW4tI3+aZqHPZl6bTBAn003
	x0lLNn6kv5e+ZSr8ewiqsLbVFasIXFfF1uNxffyhAZVR5zd2ZKQGSumS
X-Gm-Gg: AZFdTZcf/U0CxZ+aiT9fuDqxQEhRxp8GyIk7QnqWspPK1iyoFzeIYlXeH0qSa/ZK5Hb
	WIzToP12UvHn9xDZ032l0AvFpLceLNTPJAmLT99idk/wp/jwX0eojTzCdidohkJgOXPZXFyL8wO
	f1SVOH4QutfFXmjLY5pecar7vaTl7v9odCUD0k+n8+JkJFk3QXngBeSA2m9inzy0Eid2Kox31BV
	5I49xIKTsQd8oeeHqZ6orTOiMgIjRVy3ofiHW/DEaKi52rpylKUBi3vPrbeWimWw7/B458ioIvG
	k0eMSq5kQb4fqsPons6H4KQ0ZhPLWu31hPo5NZ9LKCyIMbQcdWVvGPNIGysC5CnVuRrwCw737zn
	nJBjodBoctGuigZbPdXL8HbNeVifjSjdO6gLt+Cod8dKe93uYyghjzmhYMI3epScWke4EKbgxuz
	qZzoc8CQEBnOrukVfAPlhY4Dsk1ggkY387mYdY3+rOorCCMawBMwCs0Z12rMc9FGPQUeXDM05MU
	crOq1mD3f/d0zbuxWuwsaM4hIRG8TDCR5Mf4bEBCEbypXxxr9Vv2IidZSHF7aD/63edllckvbv7
	l+S37Qus61lWTKpbeLagyEgT
X-Received: by 2002:a05:6a00:348f:b0:88d:3f61:20e9 with SMTP id d2e1a72fcca58-8c87d124ee2mr13760222b3a.48.1795620146973;
        Wed, 25 Nov 2026 07:22:26 -0800 (PST)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077a058sm9221775b3a.8.2026.11.25.07.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:22:26 -0800 (PST)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH 0/2] Bluetooth: RFCOMM: Fix listener shutdown and TTY setup
Date: Wed, 25 Nov 2026 23:22:16 +0800
Message-Id: <pm-bluetooth-objects-candidate-0218-followup-v2-88edfec8c72ed860e626-0@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Sashiko found that an RFCOMM socket can still start listening after
shutdown, allowing release to skip accept queue cleanup. Reject
listen after shutdown.

The review also found that failed TTY registration can leave a
transferred DLC open. Close the DLC before dropping the port
references and purge pending input when the port is destroyed. Use
the existing RFCOMM_CONNINFO locking to avoid waiting for the socket
lock while holding global locks during handoff.

Cen Zhang (2):
  Bluetooth: RFCOMM: Reject listen after socket shutdown
  Bluetooth: RFCOMM: Close DLC on TTY registration failure

 net/bluetooth/rfcomm/sock.c |  2 +-
 net/bluetooth/rfcomm/tty.c  | 11 +++++------
 2 files changed, 6 insertions(+), 7 deletions(-)


base-commit: f57f78086ab54f3b3122fbaeba2c842ba7bb6d00

---
