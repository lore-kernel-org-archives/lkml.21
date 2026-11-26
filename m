Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690288;
	b=PuvnPdHPm/HqyzyRs5+ICpi/tWawTPrt+PloBlvaY39o2a7zele+ONdDnVmfLj/LEBe7
	 6VcjLT8BcgUcEeT1ZtzmgYU6lEA1Z3DPlXAJZxE/h7JTuY5S0hBijFqji8lbS9vc+EDu+
	 4cOfI8y+KDCcokElkPQl5tmgWbTHkNAXNR456DuwyyK83812S2LLblcxz9Y31c6d/VLnb
	 5pL0b1R+oCIXimRhrsZOLDSiB9TZb2vRhCIigG91H5VbC4l2qto7XQ+zC/HTpYL4Ue7Lr
	 6vEI1JJ4tFvkdUoMaPw6B85wBIC4zUcV4i1621PUIPG+zhOqdzShAW5ZYp0VPSU3A3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690288;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=9JEgpWnCz+rbZhXDu8naybzde7e8JEfi0pth9wFeLfg=;
	b=b/3UU8xZ2oGyVLMZ+jX/R8cJC3TiEeRNXUGHkWsPCmcTRez1x+DBHK5NNBrwFwBsglAi
	 HPrI97n4RrRW7fZstxS70+1hW+HKCCZYQtdAHiQ+M4Y2xnCej87l3a6xU4V8xDHiQaMHA
	 tG90dTmqNFnCQ7vgTYm866IOQo/pJArqNLNQPoqHl3WP/jJVSvkzQZ+Z+0nQk0lDOtHtC
	 SHs2dp/BOxHjnjorbfuAigyu5OjtGjwlTnZHayMw1OsC/KM8dDvORxyEtvKlv3Txgs4kh
	 bAooMmuAjcFvIoGsBpwvKARnpHTvEN08jbxmwY7GgDW4Ia64QZMn9RrfjqSupOwgLcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IVhCp4gY;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=LIJodMzh;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56424606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56424606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IVhCp4gY;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=LIJodMzh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795690287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9JEgpWnCz+rbZhXDu8naybzde7e8JEfi0pth9wFeLfg=;
	b=IVhCp4gYsLWQlCf0GRKOYBJF5IY8FcyTE2sZBU4GP7pKfLrlpEf+6gyN6Dt47VWdFRrEYt
	nHz7eLkIRoWjycvbalTuk5g66+Cfg8M2doKmmT+dWxQgLANP6mNgWXsfjJsHLeoC5eoa3r
	z3KuFqozIENfXxqInC+ZJVoxcF2ZSWA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-AC2Lwaa4Oxq-sPjXLClXaA-1; Thu, 26 Nov 2026 10:51:25 +0000
X-MC-Unique: AC2Lwaa4Oxq-sPjXLClXaA-1
X-Mimecast-MFC-AGG-ID: AC2Lwaa4Oxq-sPjXLClXaA_1795690284
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e4d1e29f3so5673766f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795690284; x=1796295084; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9JEgpWnCz+rbZhXDu8naybzde7e8JEfi0pth9wFeLfg=;
        b=LIJodMzhs4AhX+/lBnW+CSbMtYdS0Lk6JiuaDFm2NFKLmd+DHq8fF2VPlljWOoyVpP
         XfyerrXlcUrlY3NywfQ4Su+Uc6cyrDrAcucQkw7BK6qmYiyKPOR5P4mUq4jESbl09bhu
         4IGqSEO11btOE/Kmq+bM+ukgs4s4Kd365rSlKJLcFnuHz142vCOA1U85OTg7wn7R/cVw
         JIfkEHq07Y+0KBHAtxox4wEgxs8g37RhoN4yKMJGoqRfhLZ6KaqHQlXp6kojv5RG/GuT
         LaNrdG7hrMChJG1YetYo4996CLbFmVW3/a7F0xVmnfXoZeGwrqQGRV2IehCz8vrIff6S
         CCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795690284; x=1796295084;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9JEgpWnCz+rbZhXDu8naybzde7e8JEfi0pth9wFeLfg=;
        b=N6ZLqFkOJeSHnLPMr8q6zs0od4SEHLzasEEHO8OeTmNjqnTZn92VYXL2HXqAloyn92
         rRT0Dg1oECKlM/DFk3sGGttHvbGXDVh2WzSVKhUsAj5i2212ZNC+E2H2b6ifhmrPtmrG
         lypqy2RRzsQD0zQOLrh33005sB5fmCojLAREN0Jn9Ho1NNR6Ce4YIKj08/YLUgKAvcTO
         LW7KJCjulj99NoSs83NH1x/F+VLQnA1xBmAFPc2ei7ZvuPlPfeckKbk0Bxbj3Sq5hatS
         9qu/l+iFlV+q4JeEmlmAovAichFutiwPRAjtcznqZt8gRm1wjAph5nBgJnZBvhqdclvH
         0J6w==
X-Forwarded-Encrypted: i=1; AL+hErH14FnwHWNuREjb3JQhOev1KB7MQof+yMBVqHLA28ybNCGh9KKWd6J6yAUITOQtvlljeST9hGYmOBCi/oU=@vger.kernel.org
X-Gm-Message-State: APuU4Z89PNUIJRUW9KWiNwMcrDtKP0ZkVW0OCfp3BrLWR3c2HeOdueR0
	wdIrpvVjGvmSs6npgc/60P/c5wok+n0S9Zt6JXS27bs0ND5sVygytcj7q7xv6z5e42NQYhIlPbK
	a8fBZ92sdOVBmt6vbepTiuOftdHF/3LqkehsuTTQ+r9AUZqx4m8BXgdPBb8KHn+4HKRGYs34o/w
	==
X-Gm-Gg: AZFdTZfHKCf4M/4mb8okbHBVfB9We0+ycXiMOz8eyGnpspT9UVwGkK4ui1oa9lSUk7B
	z8e5Bp0FEWi73IxYHxdAXBaD3bFGxCMlZs3VaxLayVITpnPeEnd0XX+PBezIxKCuZ5y4oWlmuTq
	jx7TF7AghsHlJiszn5qJbx3V/wujrgOVuJupTWTtjgzOBqWhhA6ig6HPExFhcpCwjoXrF6mEBBd
	wyNPkXuI5FHwQlKIiFapv7uspUeCr7yZBAfdf38Gy51HRawKfEHakOtOiyDrT8YRa3JVWEOewoj
	V6cyq+3oE+V+Q/+saCFRP6jQp6iNXnMqCaEt6sUUsQjxCCijrbGS1iqgTfI/8ZD+f9bcv09G5Aj
	sT+JXxdbEkUOxzzwzlLPJLJTOm4jLydd+6phsfAGoiCyJu4lFqH1nRbHiJDmbUeFNFDQciMa5pt
	9U/KKonVPBmZ3hhDkGrJzSs2q/BjGNc6WIOj1FYXNZupVe
X-Received: by 2002:a05:6000:4013:b0:4a7:d4c9:ea03 with SMTP id ffacd0b85a97d-4abaac57bb5mr38352843f8f.6.1795690284044;
        Thu, 26 Nov 2026 02:51:24 -0800 (PST)
X-Received: by 2002:a05:6000:4013:b0:4a7:d4c9:ea03 with SMTP id ffacd0b85a97d-4abaac57bb5mr38352799f8f.6.1795690283567;
        Thu, 26 Nov 2026 02:51:23 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61e53asm42611310f8f.59.2026.11.26.02.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 02:51:23 -0800 (PST)
Message-ID: <7a0566c6-7a5a-460c-a113-d9463be3607f@redhat.com>
Date: Thu, 26 Nov 2026 11:51:21 +0100
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
Subject: Re: [PATCH net] net: usb: cdc_ncm: don't flush the TX timer into a
 stopped queue
To: "William A. Kennington III" <william@wkennington.com>,
 Oliver Neukum <oliver@neukum.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>
Cc: =?UTF-8?Q?Jan_Kl=C3=B6tzke?= <Jan.Kloetzke@preh.de>,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118034122.315979-1-william@wkennington.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261118034122.315979-1-william@wkennington.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/26 04:41, William A. Kennington III wrote:
> cdc_ncm_txpath_bh() calls usbnet_start_xmit() directly without checking
> whether usbnet has stopped the netdev TX queue. Since commit
> ad70411a978d ("usbnet: fix kernel crash after disconnect"),
> usbnet_start_xmit() frees any NTB submitted while the queue is stopped
> and increments tx_dropped.
> 
> This triggers routinely under bulk load. With the default 16 KiB NTBs,
> usbnet only allows MAX_QUEUE_MEMORY / tx_max = 5 TX URBs in flight, so a
> bulk TCP stream stops the queue constantly.

The sashiko comments look relevant. Also it feels like this is papering
over the real issue: bulk transfers should not cause TX queue stop.

It's not clear to me if there are H/W constrains behind the
MAX_QUEUE_MEMORY value. Perhaps is time to revisit it?

/P

