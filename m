Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532547;
	b=0/SCGp6om+L04Fm4DY5XU42InKf0yyFZlbjxLq8e0I+mQ4v0tLO85ZWhUj7UScBSzLNR
	 02x/VecRa940xU9vm5khOcscR0x0spMnaRJxQb2fY3giGTxeKadpgN/V7gpyYy5Tkz6XB
	 vgk+p4q8vCOIO8f2LZ4ybQ8u/gAI4Ndk/bpRDHFy9Xc+2dSQgpCpZ/JP2ZBeoSoWpNpe8
	 VEzzt5W/TgQCeazKXJoTaJgBlWIzM4d/R6YLnIOOw7z3Pjyz31DwJ05XUXnO2OAz9gexB
	 +FekruKB87ollmbkzznLgkdl5vCvEnr8TrU2UM1L4+4hxRNXiwHrRcw/rFalu8LiIzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532547;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=A3Zs78vAQFMv0BuPZVacg1lIm5BEWb9ECrILgbe2DFw=;
	b=4B3XfbhZFWJEbtP72ANmAQeGlF2cP/S9Awf6i2eqrP1hgxJrWbvLQBQcD07vsg/mu+ry
	 jec88dYZCUjk3gNAI4pmAE3SrGh9thSiY0BrfZRY8VmiYF6SALSrof2JliHoIiUtlre32
	 ypRDDC0SetsY+E4+MzKISoyOJFjd2eXDEGsOw3VVVhELKoO3ig1sFyJIao9R1AYsxrDoY
	 8nngO2iPSbjP7ZnnepOOgIhw5xUOCwdHqIPcHohe2+ZrFUe8gqdZ/hPNdtHf1s8sJdZ+/
	 j6wtKA8qbhAU/RafDw8tRzh+J7jki362iwWgQ8ZDLkIl00fg+rx8jW4AemNK8AXB11A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.70
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7441E606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7441E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-45952ce9ee0so4307210fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:02:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795532546; x=1796137346;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=A3Zs78vAQFMv0BuPZVacg1lIm5BEWb9ECrILgbe2DFw=;
        b=KazhYkPPWqlqBEVTHn8IUg2G4oLhusPTe+wr/D39Wy0iq20kfOaGqbumZesi1D+nKv
         fkHcyOywgTFUuZFb6o90cB7VRJwzS6HQHHEav+ocMSN3ZHXIgQGJJjj3kf7PBSooy8ST
         S/Imz74Ct18sLhf2ZT0LDziSpf4ka5yZby8Er+ABkwMmg3aOXlNFfNHE6+d+9dBYBt8z
         4bmAEoFWilPaX0U+7XloAT0auRSiGVcUatcuM+MnDJq31oM4+NQ1sadySEs769ZujhC+
         KHQVdtE4fso7kgiCE4OxLpzlu0rWh2hm4fyceJ1b3vKzQFC3a6wf4O9RybNon+HOwf9z
         ywvw==
X-Forwarded-Encrypted: i=1; AL+hErFMFNizwVe71u60hbGDSvzc6FcybxwGlj0n2XhqMNNVr+7I9p7NWTO9gElgZMHxS1NVVrNNsFb3uV/MmeA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZPf6D49C90r+6L7UI0t+bBHtA1fcN/Ri1qI6i31R5xdpZ5Cj9
	3G4tRH08ZsjLzJykQi6x2nDBQP3VmjFU5IvR2XqbmO/RwCnUlJ5KdDFqy5LUycDztKUry5EJ6bs
	B3s0KyQUJlqHv/pjNE9ADsjLTbq7leot9xBK2bodJrZUwbNh334LydHEDG4M=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:151f:b0:4b2:8d7b:390b with SMTP id
 5614622812f47-57a0a936138mr14817660b6e.19.1795532546181; Tue, 24 Nov 2026
 07:02:26 -0800 (PST)
Date: Tue, 24 Nov 2026 07:02:26 -0800
In-Reply-To: <20261124150219.3833-1-habilerenturker@hotmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b05a702.44b41460.34b83f.003d.GAE@google.com>
Subject: Re: [syzbot] [kernfs?] KASAN: slab-use-after-free Read in kernfs_find_ns
From: syzbot <syzbot+8c2fa00c27ecafd148f5@syzkaller.appspotmail.com>
To: habilerenturker@hotmail.com
Cc: habilerenturker@hotmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test

Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

>
> diff --git a/drivers/infiniband/core/device.c b/drivers/infiniband/core/device.c
> index 29af9fe860e2..f2a52af64718 100644
> --- a/drivers/infiniband/core/device.c
> +++ b/drivers/infiniband/core/device.c
> @@ -1030,12 +1030,13 @@ static void remove_one_compat_dev(struct ib_device *device, u32 id)
>  
>  	mutex_lock(&device->compat_devs_mutex);
>  	cdev = xa_erase(&device->compat_devs, id);
> -	mutex_unlock(&device->compat_devs_mutex);
>  	if (cdev) {
>  		ib_free_port_attrs(cdev);
>  		device_del(&cdev->dev);
> -		put_device(&cdev->dev);
>  	}
> +	mutex_unlock(&device->compat_devs_mutex);
> +	if (cdev)
> +		put_device(&cdev->dev);
>  }
>  
>  static void remove_compat_devs(struct ib_device *device)
