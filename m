Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439886;
	b=rdV1ncPhluQYs9r7TsuTT84w2QyLkKZ/v5WT56fIjmVdg5ugPG8rw9+8ScUfbBHXTf5P
	 aXCWBd3ih1yksFkETzwsRmZfU222sRdiUfcFUMTzSlAb8erxoHwa485DfsfWU0c2fwjGd
	 Nha2xNmD2/tBuWZ6ItaSl2dEfjytCuUqrhFzSNpxMpAR0dFhddHIajbyyRk4Txf+3ZGiv
	 idQdGsuGAhy8+OLwjvT56bkzE7yAvpp00afze+KtSCaievd0z66Hi7z2z+iZX2eGvB1KJ
	 paANQ5clUafISEVav1iUFIXXV8XL+TBJYhdbLo4it4Q7LkqDqp34xMEW2gw2zE3cTCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439886;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=G8b0M55Qsr5j/jjPgd1PFdARJOj0KhBIrnCc7fyRQ00=;
	b=F9TTEZaaizJYGw4f/6g9y0lJj+23y9Y4s9fczUsIfJ3WEjup/zRrUcEAOmsv9WBWW9Mh
	 tztRnGTHkUllLT/F/W3zzBhFtgSeglx1a0gs+PaXBbAMHxBb8zXnY1lUsPvU0gvt/TLJe
	 /CGStIjsQvbdhCJaKkilEoWs4OCDs6tIUYeb6OUAqvgZFAlc71kb+wGdX3EiZMT/ZaFX6
	 O9NRP4kWZLB3ke7CkkHIl/0BjCtpfClcV9AvaT/Gf8PHNRqAG08sAt3uyjEzg4WAmqO2X
	 4Iwv7FBPQZ09diUabdvaK1MbcA6gUKxshuqLbDE247Ojjje8OYHZw6GftHu8yxBMpyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AoiiIpj0;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=m4CuOqD1;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1822606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1822606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AoiiIpj0;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=m4CuOqD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795439885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G8b0M55Qsr5j/jjPgd1PFdARJOj0KhBIrnCc7fyRQ00=;
	b=AoiiIpj0VZTp93rJAZ3T8xrfi0Oih6SS/iRqZs+Sd/TTloTOuS4JD6P2Ere8+TnUYGq+PX
	tVbxLoWm7HN4LGuFdrGZiU6cae+j7QHwSmS+zDVxxRZ/HTv3Y/z5+H4kfjNzls0zHxzz2X
	hVSkmFq+MSw8hWyz5z3e2RysP3O/Auo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-pqTlB1d5MeOUHnPCGm6gtw-1; Mon, 23 Nov 2026 13:18:03 +0000
X-MC-Unique: pqTlB1d5MeOUHnPCGm6gtw-1
X-Mimecast-MFC-AGG-ID: pqTlB1d5MeOUHnPCGm6gtw_1795439882
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4901562b819so2390737f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795439882; x=1796044682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G8b0M55Qsr5j/jjPgd1PFdARJOj0KhBIrnCc7fyRQ00=;
        b=m4CuOqD1CUmhFdN52EyYvTwbgcrXJHJuGricGbFZdL59CJbLFuFONQ6tex8gGVNcKY
         kLBNBqw0jskC9GgJctOqg4E9bK6D2z7cL15tZUqsug03E/Joid/lQpleDcFPmQwjhJdK
         4C0fWhlKKomMCF/ozv/NitIvG0EN62q40txRSq25zJKWBLKy9Jus1h2jCwKNdJajdO+b
         lIuLRl2wC/giU/5KKFt1nwjxFr7gvtyhq7URrUcA/Rg/W+aSfXNGOILExUtiYDD30fKi
         wLdfriIXuNok0QGLXKOY5gnA02TRIEkM5G15JoGTTw5caOLhwkex/iupB2ekfIWrSRJV
         /RPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795439882; x=1796044682;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G8b0M55Qsr5j/jjPgd1PFdARJOj0KhBIrnCc7fyRQ00=;
        b=c9H6Plg4MB6yNEsKZPR6M2XcGGmJWNYxwamJnNBruxk9KrL8A1DzgT3UX198tsBN5W
         1Qe6bk9KDazSZ6HjGKZkShm/gtMGKUENemjaBV6EifgIOIwqNjXnT8npGKG2mVfYmWpR
         37w1/HYFg5KuXd6IqNRZ7KekHF2Yq+P2B+EOR7JRq/aLhlyHGOiEJCsqlyf9Msn+WyUP
         7ROdt3e4Mn1nBiD6sox+oWwj8RJZP4zAGowbkZf9qPpOrmb0qOjKFOwyVfcFFUNSoT/E
         cz1coXVAYkiCcX0J9iXs9ofEIql7XpBxbabgRmi0NLfYWKaKAh8kT9ws8TfGFI26ct2M
         oZ7g==
X-Forwarded-Encrypted: i=1; AL+hErGn8WsxfICQVl1YcHYYNQVR0tyFCAwqeypfv9C/AKpVkIr7ZK6V8p8h6nQc1VR+zp6o+Mle4ClBOqUuosc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DCdkBX9fBXwP8OCDmd1sVrSERaDT/I7pbsPRKY2RZK7Oy2I5H
	yzCbgzcRbp3szaOOxl3stc5FkWXgwdVc0u6g8F7KKOnT8zVeNJ8vTsEPLatV7FAB5mihee54xyY
	/z4eg+/rXoAMdAa4mTIElsbWchwWnQYHnyk0p9yQpAsqy9vvQdzj2rz+3kLLgZ3hnrg==
X-Gm-Gg: AZFdTZf8gy+sjWHsUpngoSiwLR+4GuHRDoF0ILYq0amKOB0sJZbYTX81ZmnnhKyfljM
	AGPg44deJMDe4oDf8cs/cCXvZ8HwHvUX5rvZsX6Kl4Hv8pfBLe9WV2WcOPfWMaWPNT2GhqgtHrx
	E3Ze4SrfRtrsa3DMTjnUGYLTv3Tj027Kk0nE6rXmv1NkSFPyXjh6/OdV3sxPM5f8OLGZBekenVn
	kRfxHKnoCBcJRH/dVEPPeOCNpdEPT/Agux/zatlcEV5GbERtHH6Xd8MH+8NWd2RIwW4NKw50ank
	MHQfEXqXAQ5O0G8sYUAknTwKHWgyI8yX6lBLgZ0D5i6LIInrUctCw608f+DPWdNkQlVR3MibjGV
	3fO9GguDHCEDdjcZKSFo+D6pjW7rMnGZUdkxcaRS8k5sADFBx1+CWdg==
X-Received: by 2002:a05:6000:491a:b0:4ac:37ff:140b with SMTP id ffacd0b85a97d-4ac37ff143amr20351747f8f.25.1795439881926;
        Mon, 23 Nov 2026 05:18:01 -0800 (PST)
X-Received: by 2002:a05:6000:491a:b0:4ac:37ff:140b with SMTP id ffacd0b85a97d-4ac37ff143amr20351692f8f.25.1795439881467;
        Mon, 23 Nov 2026 05:18:01 -0800 (PST)
Received: from sgarzare-redhat ([80.116.143.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm22435688f8f.58.2026.11.23.05.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:17:59 -0800 (PST)
Date: Mon, 23 Nov 2026 14:17:54 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Bobby Eshleman <bobbyeshleman@meta.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowangio@gmail.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Simon Horman <horms@kernel.org>, kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] vsock: only deliver taps to namespaces that can
 reach the device
Message-ID: <awQ5xzF8P0NJiCsv@sgarzare-redhat>
References: <20261116-vsock-tap-net-v1-1-7e24f45adad3@meta.com>
 <awQJo8WE5Gn4nYHp@sgarzare-redhat>
 <12a2b44d-3d24-4b77-9dd5-24361d5fe910@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <12a2b44d-3d24-4b77-9dd5-24361d5fe910@redhat.com>

On Mon, Nov 23, 2026 at 12:58:38PM +0100, Paolo Abeni wrote:
>On 11/23/26 10:43, Stefano Garzarella wrote:
>>On Mon, Nov 16, 2026 at 03:46:49PM -0800, Bobby Eshleman wrote:
>>>vsock_deliver_tap() clones every packet to every vsockmon device on the
>>>system. Creating one needs only CAP_NET_ADMIN in the owning user
>>>namespace, so an unprivileged user can capture the traffic of local mode
>>>namespaces.
>>>
>>>Pass the packet's netns to vsock_deliver_tap() and only deliver to
>>>devices that pass vsock_net_check_mode(), the same rule socket lookups
>>>use. vhost passes the vhost_vsock netns, loopback the sending socket's
>>>netns, and virtio-vsock NULL (global mode).
>>
>>For local namespaces I think we are fine, but what about global?
>>
>>Is it okay that a namespace with global can capture all the packets of other global namespaces?
>>
>>Asking because at this point the CAP_NET_ADMIN is useless, since an user on a global namespace, without CAP_NET_ADMIN, can just create a namespace to have CAP_NET_ADMIN and access all the traffic. Should we fix also that?
>My take is that the above question is quite orthogonal to the current patch
>and may impact old applications relying on the legacy behavior.

True, but I'm not sure that behavior was correct since the beginning.
E.g., what is the point of having CAP_NET_ADMIN requirement if an 
unprivileged user can just crate a new namespace and get it?

Anyway, it's eventually pre-existing netns support in vsock, so it 
should be fixed with a followup.


Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks,
Stefano

