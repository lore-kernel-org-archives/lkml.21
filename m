Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785936;
	b=mo1a6VynZdC2u6pmwyRiSncpaCie8czrmineiIpcWgwEs9Y5/x81AAcwPAD+XKRIFQgl
	 DeW0koxSFkJjYeOyO6iBp3sHm9zCW4I+eF9P8BdigWxMlHbEoZcyOHx5pFZivKmAKlyae
	 5ct+nVEgIiJLF2WuK6rTV+gScyvC8fxhWmhStJPARS4ai1blkxCuUSCtGjth86Ui2gb6B
	 UMSsVmHGGnVv3t4IgxeS6q8G3v4kgK4XRqIbDsqW4dF7Pkkb4Jvfu2c1fAPVDIPlyVoSk
	 DfjSG0zUvn3yBEUVHYAFrQrkAgEYIrQMR8F8siVvk9OUDIfkuxIAz0rS4RpMQ+L7DTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785936;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=Jm4XRzD4iSc5vtXHTlTMm6NSGXTuSp305IB4MsAwJ78=;
	b=ZoxFFGbFeFBLTmHM+vTZZfIwqvrPVYx7mU3CBv0WW1bz2TbWp15P/RuEO1ObuMPVAjdJ
	 waUURbdGRTqFxtdNEAlVJgfEOrDpJogUbjFgZyusyFxX53rH+sEOk/mEsJRKENqNs6u1W
	 zTudIg8EtnT4eJ1krWf31eHssZVQ2ye/xnb7aStFABC7pEvZnZbhkdTZS9c12mreGBDzg
	 CukneFpWdLsfbMGpAnCZnqWgWZNyASOCzgcyxDopwsS5qIh/eYXs7XqIFaPl+ICXCtXcb
	 Ax0CYZtrcBd+Of4aIIjkBOq+y5Puc9kERGB8ngqV9RnfLsXjZVmw0JBayu6oFvE907A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6A8606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED6A8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b597558c4cso8573090b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:25:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785935; x=1796390735;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Jm4XRzD4iSc5vtXHTlTMm6NSGXTuSp305IB4MsAwJ78=;
        b=byekYVV59d9gvITqWT6WK4l9N9iYTttrLDWeRKJngdoID9ZOHLvZElZxSXI4EVgu7X
         T8nKeqWMokHitlZWOa4EzyQR+TXmaGv680E+T0sdwXOdSCaGYIsmBLPZgcGSb+jH7CD4
         euWtaZTGn0vQs865SBLrkKQYZvLrMfGpyoskVRA3zRj1HuFK2gcDQ9ZpWM1VJvvXNF7H
         jBgARtBg/jkpOar5A7Y9FDCNHNW0ciq7GOBVrPUnmKH3bqLWxkb422sqDWeFFOIbEloC
         Qa6uL8W+dCrcsTwv29fYXGE8QK6BhOe/JZSRzYSep5Un9wr9bZR+XBcK776MpeveLYMF
         wctA==
X-Forwarded-Encrypted: i=1; AL+hErEBXWU3CG7BDyDcn6BH5F+ypWLEceVgj+kckd1AKVKJsHHDnPLF/UWff5BWRMbXTOLok+hA0zWd/yQVg40=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PUQa+YvtW4okFPP8iLRUNK/yZwgaNFGWElBJRApa27AI1kkUw
	RsDGXcBdle5xjdql2vaEgIPsD/Vdp4XIwGIumkeBqnT1gvcugzCEF0k03bYmKAYOAkbFYX071Gw
	leGIyy4zfohw9PLVtEj9l7UTRUKy/90UjXvfEFyRO/nuqF5bXHezuaXjOri0=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6809:75f:10b0:57b:4eec:7e78 with SMTP id
 5614622812f47-57b4eec8345mr15272993b6e.40.1795785934883; Fri, 27 Nov 2026
 05:25:34 -0800 (PST)
Date: Fri, 27 Nov 2026 05:25:34 -0800
In-Reply-To: <20261127132532.336180-1-lucas.pascal@pqshield.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b0984ce.2fe6adf2.56c42.3878.GAE@google.com>
Subject: Re: [syzbot] [usb?] general protection fault in rebind_store
From: syzbot <syzbot+af76b01c9a0f0ab60fb0@syzkaller.appspotmail.com>
To: lucas.pascal@pqshield.com
Cc: lucas.pascal@pqshield.com, syzkaller-bugs@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

>
> diff --git a/drivers/usb/usbip/stub.h b/drivers/usb/usbip/stub.h
> index d11270560c24..ab5726eeed29 100644
> --- a/drivers/usb/usbip/stub.h
> +++ b/drivers/usb/usbip/stub.h
> @@ -75,7 +75,6 @@ struct bus_id_priv {
>  	char status;
>  	int interf_count;
>  	struct stub_device *sdev;
> -	struct usb_device *udev;
>  	char shutdown_busid;
>  	spinlock_t busid_lock;
>  };
> diff --git a/drivers/usb/usbip/stub_dev.c b/drivers/usb/usbip/stub_dev.c
> index abfa11d6bde7..b03c77d598e8 100644
> --- a/drivers/usb/usbip/stub_dev.c
> +++ b/drivers/usb/usbip/stub_dev.c
> @@ -371,7 +371,6 @@ static int stub_probe(struct usb_device *udev)
>  	dev_set_drvdata(&udev->dev, sdev);
>  
>  	busid_priv->sdev = sdev;
> -	busid_priv->udev = udev;
>  
>  	save_status = busid_priv->status;
>  	busid_priv->status = STUB_BUSID_ALLOC;
> diff --git a/drivers/usb/usbip/stub_main.c b/drivers/usb/usbip/stub_main.c
> index 01452f7bdabb..563c92ab88e7 100644
> --- a/drivers/usb/usbip/stub_main.c
> +++ b/drivers/usb/usbip/stub_main.c
> @@ -196,18 +196,28 @@ static ssize_t match_busid_store(struct device_driver *dev, const char *buf,
>  }
>  static DRIVER_ATTR_RW(match_busid);
>  
> -static int do_rebind(char *busid, struct bus_id_priv *busid_priv)
> +static int do_rebind(char *busid)
>  {
> +	struct device *dev;
>  	int ret = 0;
>  
> +	/*
> +	 * Look the device up by name: it may have been disconnected and
> +	 * freed since it was bound to usbip-host.
> +	 */
> +	dev = bus_find_device_by_name(stub_driver.driver.bus, NULL, busid);
> +	if (!dev)
> +		return -ENODEV;
> +
>  	/* device_attach() callers should hold parent lock for USB */
> -	if (busid_priv->udev->dev.parent)
> -		device_lock(busid_priv->udev->dev.parent);
> -	ret = device_attach(&busid_priv->udev->dev);
> -	if (busid_priv->udev->dev.parent)
> -		device_unlock(busid_priv->udev->dev.parent);
> +	if (dev->parent)
> +		device_lock(dev->parent);
> +	ret = device_attach(dev);
> +	if (dev->parent)
> +		device_unlock(dev->parent);
>  	if (ret < 0)
> -		dev_err(&busid_priv->udev->dev, "rebind failed\n");
> +		dev_err(dev, "rebind failed\n");
> +	put_device(dev);
>  	return ret;
>  }
>  
> @@ -232,8 +242,7 @@ static void stub_device_rebind(void)
>  	for (i = 0; i < MAX_BUSID; i++) {
>  		if (busid_table[i].name[0] &&
>  		    busid_table[i].shutdown_busid) {
> -			busid_priv = &(busid_table[i]);
> -			do_rebind(busid_table[i].name, busid_priv);
> +			do_rebind(busid_table[i].name);
>  		}
>  	}
>  #endif
> @@ -261,8 +270,9 @@ static ssize_t rebind_store(struct device_driver *dev, const char *buf,
>  	/* release the busid lock */
>  	put_busid_priv(bid);
>  
> -	ret = do_rebind((char *) buf, bid);
> -	if (ret < 0)
> +	ret = do_rebind((char *) buf);
> +	/* a device disconnected meanwhile has nothing to rebind */
> +	if (ret < 0 && ret != -ENODEV)
>  		return ret;
>  
>  	/* delete device from busid_table */
