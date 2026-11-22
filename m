Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795363197;
	b=axFu4bk/vnPH8Q23YPTFvT6fDgoksZXNQtWL/b7PVy8fsKgNt06C2rwbZglJ5nF0S0Xy
	 EJeGraWOJtQKCT+pWqJatbrAMFsr9UgHobZeBWg3idXfryikzw1kJcIztOEtt8AI4wRNf
	 4WVFr5DwF371owYp4ElAwF6f42yBvJ0Zi7QHitsVfxPL3RbOT2r/XDZzygsDd9hUnwtmg
	 HruW6CQT7Y8lFcR67OuqdYWWrrsGHiqlluhBEJETCvkVipppGYSuWnLgM8Y7nErHtg4Ol
	 EUEehoE5BSTdLRV5yyscTtAOOw0LMe9ZKlDPF5ijomz+m7KwDMSuk+QRqTZLb9dfm/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795363197;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=XDb7KfRP9TYLu9vE5S7fXj6v0XT0n+jmez9K+fH+2F0=;
	b=e7A1nHXRmbYoken0T9UvfW/KQuMBacHoAAqPa74EJSR6XOXYvalDezZV3fguennFlQLV
	 jP3QOkphHVmEkHSfhv7WuZx8RlmQ2u9kURoYhFIASFINAKDq6wrWiDkvJ2enVPm/AfFty
	 mTLq2CoC7TLwIbO7p4Vxam+HAIRRCtSMOfS+Hp690TTJYjhfdVTZcpUGlwZDzRHF9GSl/
	 X1xbLE0kZOel7Lzpp4Lnr3/7WBnECfEyxv+H9EshF+Bts/IXsNvHe+9ACLqb5AWDgGU3E
	 bodbVeMeAzThA3Wj5IY/eDCJrEOmGe8HcUOtljat/J/EAsOmLsaPu1+aD6PBz5aeRqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E94606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 15:59:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4E94606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4eb0b989f0eso3421596b6e.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:59:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795363196; x=1795967996;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XDb7KfRP9TYLu9vE5S7fXj6v0XT0n+jmez9K+fH+2F0=;
        b=ACOraabBLg1QfUC94PrSB9Qu30vePybqfrq835rXVJ/EqiJRUyBiVp30gBfxScUQGq
         De/cKJAt876xXkcvXQVSu4KKOBDPIl+besymba+b1WkXwph7Y+pGah/Z8HQ3XyRrKAfN
         11UK9EYSxsyHl8OWkY48im3ErhJiN0/ow9R297EiBQTnspumzeHUgfiDktvyqll22kLd
         IBPIniHEs8PWfrnaNtFy1uAJqEiy/au+/fqY0MYFu57A9mbgXU1nFZjrgxc/8vd5KEv2
         wH86KF3fTDohR/tJEcbHgVSCIZfCb4jErZOTvPjSm9lqUugm6Fsd3z6s8qsHw9HDpmzc
         RAzA==
X-Forwarded-Encrypted: i=1; AL+hErFMUWeEwHSvrBqkQbvuG/dZu0LpRxFyDJBEg9xBhdCoScqjwL8Gafjj9shZ2dDaj1YNQ8wg5RJGEFqTeWk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BZa7Qopd/OvZBH2SEjsBPmIEmlg/POgaXjmIH/omSPvMAoAsz
	GYdWdvyFEUh9MaPP+GPJDMK8FfVE5a2sNc4cF2VnvYTPGf2T/70/egr8lt0WBdT+eZsBdV0KhQT
	TSevqX2c1crlJBMs+BkcPjvA/OUIQ0m/5U0ilYGpY6IfGFALdVOXEBJECJ5E=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:221e:b0:568:195a:3bb0 with SMTP id
 5614622812f47-5797c4bcc11mr8725802b6e.23.1795363195811; Sun, 22 Nov 2026
 07:59:55 -0800 (PST)
Date: Sun, 22 Nov 2026 07:59:55 -0800
In-Reply-To: <20261122155945.2625-1-arbabhaider649@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b03117b.44b41460.34b83f.0022.GAE@google.com>
Subject: Re: [syzbot] divide error in alauda_transport
From: syzbot <syzbot+dc208a8cf8d37cf3e5ac@syzkaller.appspotmail.com>
To: arbabhaider649@gmail.com
Cc: arbabhaider649@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test

Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

>
> diff --git a/drivers/usb/storage/alauda.c b/drivers/usb/storage/alauda.c
> index 5e7f99ba8..5493f25a7 100644
> --- a/drivers/usb/storage/alauda.c
> +++ b/drivers/usb/storage/alauda.c
> @@ -96,6 +96,8 @@ struct alauda_media_info {
>  
>  	u16 **lba_to_pba;		/* logical to physical block map */
>  	u16 **pba_to_lba;		/* physical to logical block map */
> +
> +	bool media_initialized;
>  };
>  
>  struct alauda_info {
> @@ -105,8 +107,6 @@ struct alauda_info {
>  	unsigned char sense_key;
>  	unsigned long sense_asc;	/* additional sense code */
>  	unsigned long sense_ascq;	/* additional sense code qualifier */
> -
> -	bool media_initialized;
>  };
>  
>  #define short_pack(lsb,msb) ( ((u16)(lsb)) | ( ((u16)(msb))<<8 ) )
> @@ -471,6 +471,7 @@ static int alauda_check_media(struct us_data *us)
>  		|| ((status[1] & 0x01) == 0)) {
>  		usb_stor_dbg(us, "No media, or door open\n");
>  		alauda_free_maps(&MEDIA_INFO(us));
> +		MEDIA_INFO(us).media_initialized = false;
>  		info->sense_key = 0x02;
>  		info->sense_asc = 0x3A;
>  		info->sense_ascq = 0x00;
> @@ -478,12 +479,13 @@ static int alauda_check_media(struct us_data *us)
>  	}
>  
>  	/* Check for media change */
> -	if (status[0] & 0x08 || !info->media_initialized) {
> +	if (status[0] & 0x08 || !MEDIA_INFO(us).media_initialized) {
>  		usb_stor_dbg(us, "Media change detected\n");
>  		alauda_free_maps(&MEDIA_INFO(us));
> +		MEDIA_INFO(us).media_initialized = false;
>  		rc = alauda_init_media(us);
>  		if (rc == USB_STOR_TRANSPORT_GOOD)
> -			info->media_initialized = true;
> +			MEDIA_INFO(us).media_initialized = true;
>  		info->sense_key = UNIT_ATTENTION;
>  		info->sense_asc = 0x28;
>  		info->sense_ascq = 0x00;
