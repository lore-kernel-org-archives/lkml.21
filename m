Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624904;
	b=sR19nLRYe+WIMcp53c7rjCtNko7o4JT+ukd5uq/4NybqrewF8qPQUfB7O8zgn/xRJVNq
	 rh0BcCYT60OflWabbqnZ6+zcmDMXXlgbVnQNzRde7/tW/NIdeqmtrUmMSAorygudXPk+1
	 S3MBeZALvhobdrHVVvbJAn7Riul3b0MGNBChQ4hx8ZgRffyHzQoVg+BffzElA1HkWeaHN
	 Ooo3fOrA7zs5Rd82lbAhS2YXA+9rNSrOhW1MdIg5tvLmHajMb4zE2YN6RB+p9odhe2yF9
	 G9pJoWHq9mqqFJ95xkK9HJ5ymjvgcBCvabthkjLWPjUjRztNKFOLdJDj/ZZ6aYDU6Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624904;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=IdjfLdJimPGqv/1f4+QLlSY9sA6ngGvkbX0Nb5aeWp0=;
	b=p1vYTp8UPBQIvvcN/KH4blkF3yosIM6M1kJl7I8FEiWOaabmfte5FDiundCxY4fOrO/w
	 ry7Ux0dshnBzh/MT/X6yIsMR2G7CkK6l7vi0iWjSjeXOeYPGxQByONIxN35S4/ZN9qAr2
	 tuhDpCaqACPpqUJ9NXWtD1gABxFgtoRxeSBNZpY1FsIaax/GedUrsVIfxD5G2gnKFxpV3
	 LRA7ZkuIpEfSqhM7GE85i7lQouZv1Z1qxSkmMyHq++tYzuTvU/f1VsNHbExaYAFMeQfrr
	 yYMB7Sjrw/6iL35NxJ//xTloa0pulKRhnhiVt8sCiZV05zbTD6dWlckUMb+8COgNFOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XWKUFudI;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08890606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08890606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XWKUFudI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795624903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IdjfLdJimPGqv/1f4+QLlSY9sA6ngGvkbX0Nb5aeWp0=;
	b=XWKUFudIadF/bSyJGXo5KPdurlWHwiKgH/H3DG0YGcF7WQpn7XsmzOE1jzOuUazOwy/NCe
	9MYqq+10nuXQjZmAdWoAuBV+/9GZOjN5bnnY4Lt0nkf9kOMrOednKVt9pELaB4Az2tgiWV
	zO7LDbXaTG/i1vMqWXnbW5AAkTnJ8wY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-433-hNXcFcPmN7qy9bm9EoFn4g-1; Wed,
 25 Nov 2026 16:41:36 +0000
X-MC-Unique: hNXcFcPmN7qy9bm9EoFn4g-1
X-Mimecast-MFC-AGG-ID: hNXcFcPmN7qy9bm9EoFn4g_1795624893
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 221811955E96;
	Wed, 25 Nov 2026 16:41:33 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E3CA63001DB3;
	Wed, 25 Nov 2026 16:41:26 +0000 (UTC)
Message-ID: <cbb7e8b0-1418-4120-abf3-f2b2f35cf585@redhat.com>
Date: Wed, 25 Nov 2026 17:41:25 +0100
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
Subject: Re: [PATCH net-next v2 0/9] dpll: do not serialize driver callbacks
 under global dpll_lock
To: "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Jakub Kicinski <kuba@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Min Li <min.li@microchip.com>,
 "Nguyen, Anthony L" <anthony.l.nguyen@intel.com>,
 "Kitszel, Przemyslaw" <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
 "Nitka, Grzegorz" <grzegorz.nitka@intel.com>,
 Karol Kolacinski <karol.kolacinski@intel.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>,
 "Oros, Petr" <poros@redhat.com>
References: <20261111164021.273409-1-ivecera@redhat.com>
 <20261116181612.107a4b57@kernel.org>
 <fe1dcdd5-ef75-4231-bf9f-03bf8536c2aa@redhat.com>
 <20261118174424.32e9f130@kernel.org>
 <dd1d61d7-7bef-4a02-8518-e17d2f50369f@redhat.com>
 <20261119133851.3f25074c@kernel.org>
 <bdfa88fe-13bb-4050-b750-962586b1d846@redhat.com>
 <ff8b63b7-b943-444a-bd37-b6fb493b5d9f@linux.dev>
 <awMP9Gj3Xhia0ZeI@FV6GYCPJ69>
 <8dc4f480-a875-4118-b5ee-2c4716ee53bc@redhat.com>
 <MW4PR11MB69845212A048D72C99D3AE079B432@MW4PR11MB6984.namprd11.prod.outlook.com>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <MW4PR11MB69845212A048D72C99D3AE079B432@MW4PR11MB6984.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 11/25/26 16:56, Kubalewski, Arkadiusz wrote:
>> From: Ivan Vecera <ivecera@redhat.com>
>> Sent: Wednesday, November 25, 2026 3:32 PM
>>
>> [...]
>>
>> I fully agree with you guys... I also don't like the way how the ice
>> implemented pin sharing
> 
> Could you elaborate on that?
> 
> Thank you!
> Arkadiusz

Sure. ice uses the API as it was designed, so this is more about the
model than about the driver. To support E825, two series extended the
core so that ice can plug into the objects of another driver:

- "dpll: Core improvements and ice E825-C SyncE support", which I
   posted myself together with your ice patch, added fwnode
   associations, the notifier chain and the MUX pin type in zl3073x,
   so that ice can register its RCLK pins under a zl3073x input pin.
- "dpll/ice: Add generic DPLL type and full TX reference clock control
   for E825" allowed registering a pin found by fwnode with a DPLL of
   another driver, added the notification source ID and let fwnode
   pins attempt a state change without the capability bit, so that ice
   can register zl3073x output pins with its TXC and TSPLL DPLLs. The
   same series also carried five fixes for the on-pin and notification
   paths.

On GNR-D this leads to:

- A pin-get of a zl3073x output pin runs zl3073x callbacks for the pin
   attributes and ice callbacks for the TXC or TSPLL registration, and
   a notification that ice sends for the SyncE pin runs zl3073x
   callbacks from ice context.
- The zl3073x input has to be of type MUX, although the mux is the CGU
   in the E825. The RCLK pins are registered with the zl3073x DPLLs as
   well, and the ice callbacks get the private data of the zl3073x
   parent pin.
- The same pin reports direction output on the zl3073x DPLLs and input
   on the ice DPLLs, and the properties ice fills for it are never
   used, because the zl3073x pin is.
- ice follows the lifetime of the zl3073x pins with references, the
   notifier and a work item that waits for the ice init and drops the
   ice notifications by the source ID.

The RFC keeps every pin with the driver that created it and describes
the board wiring as a static link between two pins, found through the
same fwnode references. ice gets its own pins for the TXC and TSPLL
inputs, and the CGU RCLK muxes become ice DPLL devices with the port
RCLK pins as inputs, whose outputs are linked to the zl3073x inputs.
No callback then sees an object of another driver, and the special
cases above go away.

Thanks,
Ivan

