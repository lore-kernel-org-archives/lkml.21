Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795297870;
	b=OKfUEITTDZhc6LdYsOksWL4yiMF5iMRTrhS9WVBjkfULU2jsfzW52tbKC9X9ysgNr+yt
	 5odX9+usAp3Ejnohd/tj9DXc1rfOAlL/JySJnhnFaBnQsuDsVKds9+R5M69JoJZy3qZl0
	 wahbNFB2LCFErR3EuF4X9u7sWgIqUW+tfI4OZu5+L5cMcW0dprbq39YbzaozCWLpMbIuM
	 GiIG0lUDO3S5k705qU0QJUKdXZtgmXM3wZL3+XVMqRSC0M3ip3VegjHoU4MUqSGwj5S60
	 EMzuTSX59cq6NkLt8W/NY5WRHrTga/wZBUSmb551CCaRPcWhUPOzYzkaR4YUAdfmxCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795297870;
	h=DMARC-Filter:Received:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-Stat-Signature:X-Spam-Status:
	 X-Rspamd-Server:X-Rspamd-Queue-Id:X-Session-Marker:X-Session-ID:
	 X-HE-Tag:X-HE-Meta;
	bh=FTZluXlroSXd57r6LLGKchatwi/nSjYLe0BSI43o5V8=;
	b=Tp1QQJODgfsmJ6qZ9uyMy3jQ7N9/kekt1kapkC3k3VswLa9VXMMAHOdDozw7mNhp86qR
	 brkgOusk8aS94khwDdR5jPbpeyJoNpJq6ia1FB7/zyHP3+OYbKxijW3B6CZVZrEE3tGTH
	 E6h1WwtlXEjmJA6KN4yN0OEbZTNnHYuV9+GhwA+F3d9Yr4ObixKnrJoIzrNi8dAYNhw7M
	 Y8OW2h4jv7idjilMEIJ2S+F4rhBls5VYpv8flI+oVy/LBVTs1yuuN+BDUMziDkndeP4cS
	 xkasOKu8aD8H7e6it+aZn5eY0NoeZ6EqXcIToZi8uLAP2ZRDtyTLP80LfxuJaiM/e8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=perches.com;
	spf=pass smtp.mailfrom=perches.com;
	arc=none smtp.remote-ip=216.40.44.11
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF4A606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AF4A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf16.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 8D3541205DC;
	Sat, 21 Nov 2026 21:51:08 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf16.hostedemail.com (Postfix) with ESMTPA id 7812020013;
	Sat, 21 Nov 2026 21:51:06 +0000 (UTC)
Message-ID: <834075e9deed32d899fd2be851620ece2c906404.camel@perches.com>
Subject: Re: checkpatch: false positive "Alignment should match open
 parenthesis" with struct_group_tagged()
From: Joe Perches <joe@perches.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, Andy Whitcroft
 <apw@canonical.com>
Cc: linux-kernel@vger.kernel.org, kernel@pengutronix.de
Date: Sat, 21 Nov 2026 13:51:05 -0800
In-Reply-To: <20261121-gifted-cryptic-mouse-9362cf-mkl@pengutronix.de>
References: <20261121-gifted-cryptic-mouse-9362cf-mkl@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Stat-Signature: ncf7rpxujhie3jagznp8pskyg9gnzt5t
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 7812020013
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/FjVesNI17F6Sk7YeovOWPlTKrXOurY3M=
X-HE-Tag: 1795297866-495392
X-HE-Meta: U2FsdGVkX18rQaAAxLbb7WGp0+YT5Et1oBXZJsSldKSYZiTNTV+Bv2dd4eO8+9YwChoSvExVvLvBgDGeywpQ63zBZup1tolnc7oB5nMbBceoAN8Z4Cb8ckh5jQBbfd26OYA4P77LggJ2xCXSsnFbw7qw74q05kTqM6CQY0+t8VB2A1/LfE4ITZlwR8gwYenuzcqe6w9BN3q/rpkUvNhAe5lGkIfu8+p9T+D8yU7Pxrs04i4A+FkrxCpcAm6Mg3ufmsxzmRH3qbKNGSdmY+iaqEePcir8HVCF0F+s5n7CcJIms0PMbtGMDNW23nu/gB87xRJtZIft92SrCb0EknaglvUGFtUlycF6

On Sat, 2026-11-21 at 22:37 +0100, Marc Kleine-Budde wrote:
> Hello,

Hello to you.

> it seems that all users of struct_group_tagged() in the kernel indent
> with 1 tab, like this:
>=20
> > struct gs_host_frame {
> > 	struct_group_tagged(gs_host_frame_header, header,
> > 		u32 echo_id;
> > 		__le32 can_id;
> >=20
> > 		u8 can_dlc;
> > 		u8 channel;
> > 		u8 flags;
> > 		u8 reserved;
> > 	);

Thanks for the report, but I don't care.
It's just an unusual macro mechanism.

include/linux/stddef.h:#define struct_group_tagged(TAG, NAME, MEMBERS...) \

etc..,
