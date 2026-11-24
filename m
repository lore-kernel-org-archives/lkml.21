Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513210;
	b=0w8Yo/+jaJlwNwHR02zzB5ecvNk9fhEIumbRssYe55dOIETaWDwZJIrsT6c6/iIlRj1w
	 9wD7qX7OvCQWc/lE4F8DTML8+//hCubVgGTbXcdk8nw+uhNANMABso8S5FpYHKUJJKDDh
	 JACnVQQvnLcSBtw1DgCUxsus4Z84+faOLc0isvGCElbUCQTUEUwdpWeiloFZvAwDlhDVI
	 PUfzKaQxlqhdG/hO9s/H3D/IrHgmtWg0pTD9ft8rYw6ZkofqSr2ICj5VOUZ4mpc/LOBc0
	 E6wUjVwuMhlMR+6+tsNVDX+MR/RjyPk3tz6rnFXfU01ngE7r9E/wkNXALw9fOjEqzRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s6J8UzkbLV15LGL0oLAQJk9/vn7+grYl4GUZDfRGgJE=;
	b=SLnzY4RFh62RUm94YXY333ABsRLPa4zCwDcSMrF9tIzxE1ndNK1hl/ovK+EbbPwSLTAb
	 RL3i51UivepU+ZRaWk9d35tz1B5kG/F0LNC0LhfSzurvgeSde9XGu9ivQDjIg0nsjJ06a
	 blYmo6inFgW/CGDbUjX7BlS8xBb74+ubquRm3+tWlzOMYwuaCwPLLHkRMGVJQ6l8tVabZ
	 Qi5949wG1YysreVeIUHJslD4N/o2Mh7LfJKXuQ2hHs8GBNZtLUjhBSvHJFe12YxynnJv5
	 0Hx1CTZWmqbr27NB3mYuxJCnpPj4I8rIa3moY2nOdF5xjQd5pSeRUQjI62CuDbOcpJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eWGKozKA;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FC4606A336
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:40:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92FC4606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eWGKozKA
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b546061d58so9650879c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795513206; x=1796118006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s6J8UzkbLV15LGL0oLAQJk9/vn7+grYl4GUZDfRGgJE=;
        b=eWGKozKANII+Rz9RAMODyX02fxfRFZDdMm+qH7cLm86ZlqKniPTp6Xgy9L+Liz+VMH
         yxlJ3EZP14Th7dP8mickQ9yfnLqxmFAKwnARWEav0gs0chRlQyyir77roVD2FxCMMnqY
         7iZpy7G6Y198ny1E7wPkdDmjC2WLOBuUoSc7zGKaZhluL2RIaQJFa27OVXjnrSb2Ya3D
         jgmNxMoxisj3XqgJONGXOdpXUKcAaxxNQ+uI6tqXMpsEtLG/xTIPFW6/pTvC/Th7JsBf
         DdK/uKFCjaskI8/sfGm+5+aDUHnFdBdsppn4HZKgIV1pO2SsvTRWX2S1iVb1OQuenbU5
         bI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513206; x=1796118006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s6J8UzkbLV15LGL0oLAQJk9/vn7+grYl4GUZDfRGgJE=;
        b=zZkfeoWZWkC82n4nmdPmVxf6xpJxQH6dfsSkH4FNWNy2jIVu5vnfgpnYbUbR5PBkzA
         yecNesQEz93oAjsj5vtpuO90SQSKdhMCTEIfKo5FYpxuwMu8t5gdZxg86qPny2GUbEG6
         IwEMShMueYPTd3CmlTFZNcdjhcb7sN9SG+w6JGEhOnhSDYti1fNVWb9ytbj9IguUqnlU
         jdp8YZnrFU5moRqBbx7cYitDds1IoNZWCtuxcVEs6nfVkcnLvZX8aPBA58yQMbrLDjXM
         V9odIXAQSsIZHgkVCrEAOnO5nevvnq4fvgcVEymwB32g0W+MgXK5ycB6tkzavqH67hg0
         LXZA==
X-Forwarded-Encrypted: i=1; AL+hErEPmO84RZtk18vyo/B7O+nThHXybqD/C5LCSbHqwiCou1WDSucAZRNo5QGzW+7RMcFaMXEINlNDxT98RzM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ix60THjI4K9x99KFFNOXFFx48DQQeaqpARDoHibmUdczOHD9R
	KK733QRBkm7Xu2H/2e3EHgSU+yrhmuEMMAMMbgKcA1nQagXI9zlulPn8ijmSrsFi
X-Gm-Gg: AZFdTZcyAmZxT9ZPDwbW7N709DYC+tK7Jxkzx2mPFGiaRlD5zLx+Qn2LO8BCRm3Guv1
	eZch96VCCayYBbVfXed3XkpuLACz4pmXfDnb0iyBafOgxVy9YL2O87PJFEIOXB7yikiH1P6JlJ6
	Zk9YDbLqIrBidGZ/40ypWqnVH9ik/4UM2AS9Cx9fl8ofcIhaUqa3UlpP/B865eYb+ghAHXROBnc
	thDk0d3iAYjeED0/+IVsBYr3/bT2cWpDzInM0AtKJsJWOPy3QFZYqvys+xa/AXW7yztPZSNrY6W
	0hbBrYcNynH8h1QnlFyocmqTiFznaRsdnr0vE0HT/lTYC85DfKlDDP3q7eoIoiFR04Wl9JGM80u
	8jwQqQnx8HhtcaZoQRaBl9m9mlrlTMWCU75h4zq/2Cekwap8VGdRdL1LupTCyuPdhyFPvPLYx3A
	HE9XuNWeX8mgP7G/aQSTZj6MSBVXtPT+eUPe1hmi1PPsZY0ZEJyunBnjMMemYDnYNrrKnSwttSa
	v/KCA9ojL4W0d4/L254vqG1KmINkVj52S3i62SBz9gxpvBrmI/TppYFwgGSpOYtRV+Xc0lr3sjw
	v5Gpd7NVMQpzdHGaIl5hKIt6oBYmfFDE2p6e1swLtoq2A4SO5ogZ
X-Received: by 2002:a05:7022:294:10b0:19a:bbe8:41a8 with SMTP id a92af1059eb24-1b5568c876dmr14069138c88.20.1795513205570;
        Tue, 24 Nov 2026 01:40:05 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.105])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm33847116c88.1.2026.11.24.01.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:40:05 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: xuhx@hust.edu.cn
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: Re: sound: core: jack kcontrol is published before jack_kctl allocation, and the failure path frees it without removing it from card->controls (null-ptr-deref)
Date: Tue, 24 Nov 2026 09:39:42 +0000
Message-ID: <20261124093942.2963-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <28bb004a.2ad18.1a2023a6d95.Coremail.xuhx@hust.edu.cn>
References: <28bb004a.2ad18.1a2023a6d95.Coremail.xuhx@hust.edu.cn>
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

Hi Hanxiang,

Thanks for the detailed report and the KASAN reproducer.

> The same failure-rollback bug has a deterministic companion path:
> snd_jack_new() can fail after snd_ctl_add() has already published the
> kcontrol (for example, when its subsequent kstrdup() of the jack id
> fails), and it also does not undo the publication.

The companion failure path in snd_jack_new() was already fixed by my upstream commit:

commit ebce20196346906cfa33a84a021ce8f9bd91880c
ALSA: jack: Fix jack control cleanup on error paths

https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?id=ebce20196346906cfa33a84a021ce8f9bd91880c

The patch initializes jack_kctl->list and routes the failure paths in snd_jack_new() through common
cleanup, ensuring that the previously created kcontrol is removed using snd_ctl_remove().

Could you check whether your reproducer still triggers the issue with this commit applied?

Thanks for reporting this.

Regards,
Sreeraj
