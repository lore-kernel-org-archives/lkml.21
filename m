Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509847;
	b=RVtcAIQgE+Hl0DNMedDGpIzBaHed4wbL7Ubh/lOUW7Hy9Ccl7JG55uULkKxUwDeEx01a
	 xDf3Yc4ppn0IRBHaYQObOMv9gQvzsBehLXGrKGNt+y/mOYpuVQDiinPGaUuHDH8Rc+i6I
	 XfpSlDIfVG0GUxhFlf2Y50qWLDO/pCv6S2jdALpNnBbKWq+qKBEkboZ/V+fvuSZynQz5o
	 ZKbEOOXMAEs7nE4OAIEIhPPVTrgJaEnScHjXzg999OoR2uKHmT9XrnJ4v9y9c7bFb/MVM
	 dCSFjO8sXsKk9ptkldnibMFKGSQleh+dKly9OcG89IsY4NSYT9CPBBKbwvDww7+JO2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509847;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=80CiTGjH5Hdr3PjM7hQctIDbA2YeYVq6CaZ6FaFB58Q=;
	b=B3Sl+O3u61jmNiODHo2wPANLAfWnV5KXWtkMfoWZz1u8RBM48HXrsN+uuitvFD73cMX7
	 iltZ/Z36YjdbvANTB6jjHPF5+UkM7258hKsgNeUR1Yi3lHl2btMF6vjKxrlse+hs+pfrd
	 EP8HS5wrB4E4sI5Yv8GFis1a2T9XFuLcNHoQFA+QPLV50cRDMMrQ8L8bFX2Lj0P+i3yH0
	 hqA+jzlFuRgSHDfFZFyRrvjldcNQKCLf+e9Uz2YPPuyj44wRkrEDuCfcui5vTjN+VGSCt
	 9+CftKBtcJq+92flJ5MxwkcdDuZcYhGH34PVbmM4IGzjZq+Le1fjRL6e0vzKK+9BxwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PQ5I01Fa;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Bmf5Fpj8;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD74606A681
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AD74606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PQ5I01Fa;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Bmf5Fpj8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795509843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=80CiTGjH5Hdr3PjM7hQctIDbA2YeYVq6CaZ6FaFB58Q=;
	b=PQ5I01FacUMVt2K85lVmNDFG470vSvbRdBOHeNdnGj/qvT4HQMvkAT6TK5t/B4BBPMHfSJ
	pqf2UmkT7wMnppsMlPCB2tHmUGbp23Bp7cOSdnvhlhaYjiTYrIwL23qrCukNbhWMOsumyV
	lF62G7qkEGUD1ZK0tmq6Wdlqqp7s+w8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-QNv2AnjSNYadElMiJD5DRA-1; Tue, 24 Nov 2026 08:43:57 +0000
X-MC-Unique: QNv2AnjSNYadElMiJD5DRA-1
X-Mimecast-MFC-AGG-ID: QNv2AnjSNYadElMiJD5DRA_1795509834
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-49090fde23aso2592173f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795509834; x=1796114634; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=80CiTGjH5Hdr3PjM7hQctIDbA2YeYVq6CaZ6FaFB58Q=;
        b=Bmf5Fpj8dfj9+YAzmmLs7zprxnhD6SqSw7cHcSsRhi3zs08vLSTERt6nt4VFpGF+xI
         KoxO5EfFihJmwOURYPuFSB9O+JlD7uaO+a0YalrQu+uG977ZkSP02FXU+hAmYXyKAqfD
         mlVrBXqV46SdsqcpXsQGiaPMoTTKEyLpYRgaivhxGsf21PvD7DyL5beRToY6e3rrPLAD
         X1RSVBzY5i2z5vmkcIiCT7ppgobuzIqjYfvKLdRcYGUMJKT7f4jtkS6Wg3jNTI977RGf
         Rv4ekNdCva491+zTMeUrOTY8gWTtDDffnC/0y0Qmkmp99TYluuZ82yaUGnprC1eQvwlw
         ZklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795509834; x=1796114634;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=80CiTGjH5Hdr3PjM7hQctIDbA2YeYVq6CaZ6FaFB58Q=;
        b=ozX1pIb9UOrgqo9zCi2x+EbBwtaUz9ZF/jCWI8UdSQOuWNe18ie8koxfyl84dVJNYe
         Q6vWdMNqJcLKmZqXmrQau8z+eaZyDBio5Q1pqn4PCYaa9sgQqNhxs6BZ2i5rmG6wimoj
         H8VBpAXXrFbUTJ3btAoYaspCKFqEw6Es5dTpsp6Ezl3TDr7jEwRkfQBFAuHh+QwbNEKm
         K/mB8YLuqPkN4y+WgdZZpuylywDX5CnRBuMXynKJIqqW53L7HZ54hAwh0ZtBFOxzMRYP
         TLhS0bNzScb1dqDwdHQpwjQ+uMBknZC62K65glPN5di6MQ2ZJ4pTwzj5STCSxU4WQEAl
         XfVQ==
X-Forwarded-Encrypted: i=1; AL+hErEOXMDYfSC4g39U02hQxBL6ZYCNqkuiSNW/I2xYfp34KMs8TP+oBOR/dvK0ZzR7gPbnmQHnPr25eGtMxFI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fE7M+1Nb2wmn2n26Iwof6geHVHA2yQ9Ncp2UkjUf6IeUGyUM9
	ho5651lRD/CJvrviWIWcckSWJRhD2503d39+PoyVJm4s3jK5UkCw0jGh3+Zs8nH0lUZYrFyKvG6
	MxAVXlwMquhxAjBsdzlbW40Q0cBB5pV+IMx5nidwt48J+wsY5IuM4kWwjWqZWolfrvQ==
X-Gm-Gg: AZFdTZcsxG1LWqoGALH+FOEUsve0rqIQXyYPISh2Nw9nm1S8LL4Mi1dc5oFLbPfkHnQ
	b9Dm46uI1svuTFnngkbXOn96BWIGkCojCZodpD2g5GvLn7gC8Gx2YzaulIraJJzz31Z2lZjAhkJ
	L48y5tblOB1sPlBeKmc5p0yvcim02EAKpt882SGPPu37mjO2IK+k5B68YfeXJc9Z+Un/uCK41FI
	SL4ZXojfpvA6t+p9JfC8fUq12bxXw+WH8PM+jXqrCJ4cvi6Z8R6JtclrHh79+Kv6APgKYEs5tky
	452aZ3vcnFTmF4zCibJXCnD+dCrV0G1NWugUfkfy7bo+OtOz4hN/Lz0XzKxY+U1gIe9vf4KqQ89
	JrLRF+NfPLzqUI4CBmt9OkZOa0Eyc4VR6RUn+SW/cN3P0fEti189r9A==
X-Received: by 2002:a05:600c:4f10:b0:4bb:60bd:5398 with SMTP id 5b1f17b1804b1-4bb88804d35mr314618245e9.10.1795509833922;
        Tue, 24 Nov 2026 00:43:53 -0800 (PST)
X-Received: by 2002:a05:600c:4f10:b0:4bb:60bd:5398 with SMTP id 5b1f17b1804b1-4bb88804d35mr314617705e9.10.1795509833526;
        Tue, 24 Nov 2026 00:43:53 -0800 (PST)
Received: from sgarzare-redhat ([80.116.143.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b216esm472636285e9.12.2026.11.24.00.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:43:51 -0800 (PST)
Date: Tue, 24 Nov 2026 09:43:46 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Bobby Eshleman <bobbyeshleman@meta.com>
Cc: Paolo Abeni <pabeni@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] vsock: only deliver taps to namespaces that can
 reach the device
Message-ID: <awVNJ4gXA7ZxvZcb@sgarzare-redhat>
References: <20261116-vsock-tap-net-v1-1-7e24f45adad3@meta.com>
 <awQJo8WE5Gn4nYHp@sgarzare-redhat>
 <12a2b44d-3d24-4b77-9dd5-24361d5fe910@redhat.com>
 <awQ5xzF8P0NJiCsv@sgarzare-redhat>
 <awRnZ9S+3B996VqJ@devvm29614.prn0.facebook.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <awRnZ9S+3B996VqJ@devvm29614.prn0.facebook.com>

On Mon, Nov 23, 2026 at 08:18:47AM -0800, Bobby Eshleman wrote:
>On Mon, Nov 23, 2026 at 02:17:54PM +0100, Stefano Garzarella wrote:
>> On Mon, Nov 23, 2026 at 12:58:38PM +0100, Paolo Abeni wrote:
>> > On 11/23/26 10:43, Stefano Garzarella wrote:
>> > > On Mon, Nov 16, 2026 at 03:46:49PM -0800, Bobby Eshleman wrote:
>> > > > vsock_deliver_tap() clones every packet to every vsockmon device on the
>> > > > system. Creating one needs only CAP_NET_ADMIN in the owning user
>> > > > namespace, so an unprivileged user can capture the traffic of local mode
>> > > > namespaces.
>> > > >
>> > > > Pass the packet's netns to vsock_deliver_tap() and only deliver to
>> > > > devices that pass vsock_net_check_mode(), the same rule socket lookups
>> > > > use. vhost passes the vhost_vsock netns, loopback the sending socket's
>> > > > netns, and virtio-vsock NULL (global mode).
>> > >
>> > > For local namespaces I think we are fine, but what about global?
>> > >
>> > > Is it okay that a namespace with global can capture all the packets of other global namespaces?
>> > >
>> > > Asking because at this point the CAP_NET_ADMIN is useless, since an user on a global namespace, without CAP_NET_ADMIN, can just create a namespace to have CAP_NET_ADMIN and access all the traffic. Should we fix also that?
>> > My take is that the above question is quite orthogonal to the current patch
>> > and may impact old applications relying on the legacy behavior.
>>
>> True, but I'm not sure that behavior was correct since the beginning.
>> E.g., what is the point of having CAP_NET_ADMIN requirement if an
>> unprivileged user can just crate a new namespace and get it?
>>
>> Anyway, it's eventually pre-existing netns support in vsock, so it should be
>> fixed with a followup.
>>
>>
>> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
>>
>> Thanks,
>> Stefano
>>
>
>Its a fair point and I agree we should take it up in a follow up. My
>current instinct is that CAP_NET_ADMIN probably shouldn't be enforced
>for some (all?) of these global-mode paths.

Why not?

I should take a closer look at what’s going on with the NICs, what 
permissions does someone intercepting traffic need to have?

Ideally, even though the addressing is global, maybe we should set it up 
so that within a namespace, you can only observe traffic generated by 
that namespace or its children.

But honestly, I don’t know how complicated that is. In fact, if you want 
isolation, you have to enable “local,” and at that point, with this 
patch, we’re all set.

Thanks,
Stefano

