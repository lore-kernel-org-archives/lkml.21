Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795216238;
	b=nN2mWO7xMuoa/6BQzFwj9ZRuVhVeRWsK2iyEUNTk8fD4+JmcwAA5PBa15NXXqjcXSIeN
	 Apx9iRKR6z/og3bFF9daDLAON2al8rp7K8kCHRFIVXWWqNbXGzWC6MgIL4u3AV2k0yrka
	 VmOU8UWjAeljR+Dp4ZSNlgH8hGJscCffqg/8WlDcNLgicNxP/nrdEe7sYATfimG3DZonF
	 OoyXFDFKWDsSPLWDNH3mlHwjZk337+wZ9vjr90oVyKoPi//S3Dd7o8m+Pb+ALdo9BlmsX
	 QuqXI4L/qDlZ9hHl090JrIjyItx9zmGO027UlaCpHjdflf6aJy8Vx7qF9vLTREgGAUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795216238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=H7IgPj/cGkUGfI22HQa4cXM5+YTMvEzdbQOzvIOqNzM=;
	b=HdpJK6zSkkgcfj43xzJ8E5OBnoIlfA7WgzLUbvvUlg+XYFLlUogirkViztg4QV3YrllZ
	 BpfpWziErUGRLS/IiIQQrrB71Ap0qo8lzF6H455z5jqmFcY6eHdmcnRRIk1o6LKNMZsw5
	 3EUEvNYSTu54hRgVu6liHCaNF1xMzoLavQtfve9XKlyyiQAFCHWxf8FBN2GrGbhDppC6V
	 qIwLl197TLK2NWHPnR5ZLHkDZro87/TzuY2UxHKns/H/k5DD5YmeS/OEjixM04sJC2/zj
	 dFWNwpLdFdrkNAtkUsWFl1FJlt9esZzkWwe8Y47TwrkIlBwvd2my1NOMyBoBvgAntmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=VL7HSqlQ;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CA9606A6AC
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68CA9606A6AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=VL7HSqlQ
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4af81963f35so960060b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1795216236; x=1795821036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H7IgPj/cGkUGfI22HQa4cXM5+YTMvEzdbQOzvIOqNzM=;
        b=VL7HSqlQMHG7OiXxOaPDemnt8QHXpLfmPyRnEgPeBCXL3Q0dJk3S6iJ+MKGG326ZSl
         fKtFsA/X3fJXQoA7O7e6nFpjzg5nWlIT6+dzXuxysJFifySuUzrLtHNirR4oR3RJdu7M
         BHc0r3gIMJVUKE9xX4ke3uSHmbdTyANQLJvgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795216236; x=1795821036;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H7IgPj/cGkUGfI22HQa4cXM5+YTMvEzdbQOzvIOqNzM=;
        b=p3BDTFUzjLV8rxDjvdb08lazTc6zTtv4FBAw8BsiBqtF3fP27Tx00LwCOG4w9FRdUh
         /uuPpbuYdGpA7Oojo/ijNx4Vi4gGP3Mxa0CvPBlzAknIPFP9/mQfjC+tJOjVO0Lij0+/
         kxyBZ1dkTWQFAKTeI63ulZwnmo3huw+K+FXR6z6CyWfoVXqXy52XHa6gssMNpajj7R0y
         lIRnF/ZYEa8P+JDiOtaxdSy4Xfubdk/fvNTk7Whq7XYyvafR+jeI+PsRZgX2GNcw3njY
         bWGVRpYJSDxcs/VUfNTP0yNk18/lrqvUqw+b6+uCM1sVk/EEf9t9UFSlbKR1kb8xDuIm
         IqOQ==
X-Forwarded-Encrypted: i=1; AL+hErGo3nQbcvvZPGSid+gdLPvnqvznrgmTSHACXfZd2Rug9qa5n32JGS5/NuXNOmhtNNTf9u0GC2lZ2SpLm0E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CjI+Xm4Kji0RCU7DrCnI2tg/8GOME7W1Tvgt1KFsD0pAridKe
	4GnAo/p82jo2SsOMOG2TmkHWcWiw1STNRhz4GCmRhqXYryr/vPZfsydec7DEK0CNhEw=
X-Gm-Gg: AYBFou01dwEhdhqwdYHO8Rjt6TMK/8t3QOvwwSSXwDIwWWyMPn4G5nbqgnWprwoVfhi
	pHIOJcnnxbXJiOGHMKoLIM7DAClx3c3Ev72OIF+Sqgyg4gDZ6nho4x8Bi/s6iLGZcUauIuyt40C
	+Eolm99EAL99CzO6Fud12OncCCeC0DB4xo4JNoaS1cGyU0vJBizFH9NKVtkD4ZnpqsfDX37fdw0
	im7ys4kfWplrfH+4NFybXbUrQIIJrWWr5F8GumG6+B0UCUks6rwj5TTs5LlI4USS5XokDgQTfjc
	RoKGk/uet/EyFQJkbG711elA6ME47vsj29DvMiOPDVBIPkFYO/J0IJkHMgt+dZe02Iwf2//KbOB
	7QMTtKHLF7XBe5zznDTgJWaidbZ2X4VFZcREZoPUDlwo14TW5u/taYvvPE/2ck3vlev+GG0jOgS
	px60/Td9rSNE9ZJKfyme1N4+HrIycFR5EEkU8pcr3w2a6DbeWuGXDdUdEa0zSOJ7HEjtdM2Wm/Z
	AeLmTvAyaqEsPCLne61pXMFSnS55Nsd8blPIfKYIZoa7RvuBFHQl7IRl8yibnCGtdLOyiK63MQE
	Mr/YYVQGji6TyAUkKzp/ICe9VXeta5uMahIjnw==
X-Received: by 2002:a05:6808:19a0:b0:4d7:17d5:6c9b with SMTP id 5614622812f47-57a06d19fcamr4954554b6e.9.1795216236254;
        Fri, 20 Nov 2026 15:10:36 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a34250fa1sm3068142b6e.5.2026.11.20.15.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 15:10:35 -0800 (PST)
Message-ID: <8c9cdfcd-4520-48c1-ad58-c8b90518ed35@linuxfoundation.org>
Date: Fri, 20 Nov 2026 16:10:32 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] usbip: make remote list honor parsable output
To: Jason Colapietro <jason@suedeai.ai>
Cc: shuah@kernel.org, valentina.manea.m@gmail.com, greg@kroah.com,
 i@zenithal.me, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <CA+Z0x2JTGOsnu7gNPWBfxCZD0vesbezJ7-yhT1sOOuUdmdcQRQ@mail.gmail.com>
 <CA+Z0x2+wLqeT84WGYsWQ1bPu1mz_A72_Ka3vv9u6RHdtQvc_Xg@mail.gmail.com>
 <96eedd54-7d2d-49a8-97a4-44342460c9fc@linuxfoundation.org>
 <CA+Z0x2KoEghFkYKmXckq3ezLo5bvgHJ7yG=JqjHu6Ga3t1wuew@mail.gmail.com>
 <1557ed70-d2da-424c-8ba6-10c898bbb81c@linuxfoundation.org>
 <05047d41-499a-4e96-ac64-bebdc0b330c9@linuxfoundation.org>
 <CA+Z0x2J9iCWO8aaGaLBOf-pK6vaCpatQH-GORPRaJMn6NgZJeA@mail.gmail.com>
 <CA+Z0x2J7S+0d=ceG3tnpkcB5nfEtNNzUcNkhVvJmzy=yHPb06w@mail.gmail.com>
 <CA+Z0x2L9ho_Yq-BCSy2hBhQP6Yp9pmMaC741_YSk==0vS_gmeA@mail.gmail.com>
 <dda50295-e49d-4424-bd80-32da6d562966@linuxfoundation.org>
 <CA+Z0x2Lg3d-BTQqeWiUjz6GN17QAsHsqhTWZcfA2szT2Jvrz7g@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CA+Z0x2Lg3d-BTQqeWiUjz6GN17QAsHsqhTWZcfA2szT2Jvrz7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 13:52, Jason Colapietro wrote:
> Hey Shuah,
> 
> The issue is pretty simple. |usbip list -p -r <host>| shows the device and exits with 0, but it ignores |-p|. So if a script is looking for |busid=| to figure out what to attach, it comes back empty even though the device is there. You can still attach it by hand.
> 
> With the patch I got |busid=2-1#usbid=46f4:0001#| from that same command.

Thank you.

Please don't top post - it is lot harder to follow the thread.

$ /opt/usbip-before/usbip list -p -r 192.0.2.1
Exportable USB devices
======================
  - 192.0.2.1
         2-1: QEMU : QEMU USB mass storage (46f4:0001)
            : /sys/devices/pci0000:00/0000:00:03.0/usb2/2-1
            : (Defined at Interface level) (00/00/00)
exit=0

After, on the same client against the same host:
$ /opt/usbip-after/usbip list -p -r 192.0.2.1
busid=2-1#usbid=46f4:0001#
exit=0

This change removes lot of details about the device. How is
this helpful other than for a script that could be written
to get these two pieces of information: 2-1 46f4:0001
from the output.

I don't think this patch helps, it makes the display harder
to understand. I won't be taking this patch.

thanks,
-- Shuah
