Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795211059;
	b=BFT+VySWG9n3HEn7EALpv0vELQ8KR4HulucGCEY+bcV72Bb5QSq3Tyn+PO/BkK9XKVep
	 rVuTY7ftBUwAnlfwKJ/aKRBdmsNIXaRwhY29HnOpSqQjvlUh+G3QI7z2si14PKZuB8BhG
	 EEAlBYZ/hEstr645PDnJNw3+dk1YsjoIkvRfWtwwxLCG1eOZl5zkGVp6O0KQuQJOv0T7E
	 Q6CA+BHROjm5RDNfpdUtCy9j1JoHvH+joy8gMntTTmf7ct1VbzDbFp2WQ/1UmnKvoTXaS
	 4QnWYUdeNUSmN+ic4ZF+EJDbX27Tc1ZCBHxRz6s7ESpwvKpFH224L8qcM2f2inaLOXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795211059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=nQPsyAfPITnc8nPJ0x4PphI6WYhqgT5+1sVMxYgDGX8=;
	b=NVuv51PJBHAVRxLI1CeGjttbz+Mfw1qcYBzNLtWCV5XQR9GIZ+BXY4YknKknPr/8Ecqv
	 eCJj89wJJ2e1AeDcLgD4d5hV4k83SGCLAuwU7bBqdUzEDJf0BzN6a2Y9oDQ4wCZF5CYHN
	 GZ6jEu0TcbaaEdWJv4Ht/bWi8yUz4lY59VFIdx/5KjlOJSrwnBU7mLH9v9caj95itasWB
	 ldqhEBzkJBrD9j56zAD/vQ80H1Rvz+00q7FkbnuSZnL8mQW75B26JxGmlzEr8FHl4S7sq
	 Pt9A6mjER9dYchrn6j6srsZ3z//HkUT5izXU5cHFvGweBfehYnIRhaLMyUvy7oERA9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ezVSYIi8;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F71606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 21:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61F71606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ezVSYIi8
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-9496400270fso124268985a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795211058; x=1795815858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nQPsyAfPITnc8nPJ0x4PphI6WYhqgT5+1sVMxYgDGX8=;
        b=ezVSYIi8tLByxNajlltBBgLnQ/sRRbAnlFJ4dAKOoRwG6Zl3azd+s/BBDJ89tgcLX+
         YZXuXZw1nceAJqutY9sZ+iqBiTEMn+TbZbs8J/wQI0vxMkON2aDhIh/WmJk5oU4XT1Wb
         aoNuJTbC+Ux0/yEsygbQ8ZPvcwK3/u6zLMLnsbE1ZASZdZxPV3OnoNHQUEb+FgpBjVwi
         E2dShug1ZHZUKOpn4rZcsGw/IJZKSrh5Lqe38L6dyTewujrwo6+/kv/orH4e4PVfj8vn
         YKx3//a1fw5IPEMldB35X3DSd7H+R+sP4Coj1nXgn4JrgrCjlS7WoXaqrEx19MqhQNhg
         0mQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795211058; x=1795815858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nQPsyAfPITnc8nPJ0x4PphI6WYhqgT5+1sVMxYgDGX8=;
        b=lFe5arbv01GPpcTu5O1oMe9jefoozVdoCv2gX/hTrHLw5mtZr08I2VWORPf9vUXa5m
         onFFydlutF8YPdcPziPHCP3fVQvz+Eh/2Vhotu242Y+UZ+PQpRHRQo61fct8xFWvmZHO
         pn1HUeo1jQZmEEhG8ggIhLG07M90Mw1ArxBzuEhnRJ9/2NXeS4y7IdqvZvZiVMiVr0CI
         WG8oClci5mJ6p7/AuZeaJzdgR/IUSEVmJO8mGdX6a3Hz+1oa5yufA1jjcPK5tFJTaLi9
         ZvpZrtm2idrvjWqHQT57wRMzSsYw0EY9zhTDwc7Ofqj4VjO6/5GyukQobvxF+Hzqf1Vd
         puyA==
X-Forwarded-Encrypted: i=1; AL+hErG3c1DDPLTvt7gffCVSvzx+Ot6BWJF+uRfz5qL43pxKQuR8AZriMwS0ocM0By8h21+JVMmoOsTxHoRKhBA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SraWPgOW9o7HAc1jDQGtcnacshOklD2QVyeIEyALrFM5LRDpK
	8ZY9/upC1peLYHvXV05FNZdG9hyafbi7wDnZX+C233vKbgflVOkbGnkG
X-Gm-Gg: AYBFou2mzp/l0i1c/KHXtt673H9O3935bbPjddNIu/sDpMEel8mdnqw7VIOpa9YDU/b
	oTPNjU99LupuGd86cCX6GhPwKwU5a+WEXmv3c6oP89g26zYPEtYFu+2c2cbIrakR/F/EgFE1d80
	PPnYEMTlzUP3GFYxgcG2tCU731zUCCsg/VKt0RTYQOdrjuIiQRUVEm0Z+UCMnPPIJ5krk67dYBB
	pfq+BHDCgJvi8asf9RWTz58+vsrpJz0yjATdGX7P7xwTdO3dO7bNRXBzfhvXNlMwbUpQu2mRw/c
	DvcXng6yX01o99ZjCTNvRyVXuclsQB5bDOVGIarf1mbzeRkQ4vb/N3rZH4GWga0Lxc7i2cGT6jm
	mE4N0B8A3k4UEcMR6RSt9tDOpu4TcNfEGwCRV3CCHXd3p0d88ZgoduDc3yRXloHqi5ngKOaakxK
	xVKNKyQBUaf1ArXGXU/IQUncalNJdDbg8B6rBn7K74C9q/lvW3eRLD2SNErA2AURr1l01uGDvrp
	6PO/cqV9qka04+AMs/gJq4BtNj3S3hBGAo90ojpdI0OeIgMps4v6SPZ/HZPiCRQI0qlfgSJogJZ
	Sa8wclzDVeQlRD+V4C40JSpcZwWtEI5963GnKUkg3wxR0sevXKDQVyOSJXlNa6yjTFsifQExjYZ
	gME0It+CpgpD2lHC9RzfTdJi3oFmG3EtC90nEa3ikkdLR+AmtKrngvukTk7KUPyvkb75mO8tjg2
	5KD4v18t4oIo8hPoq+5BnjsbjIfJE=
X-Received: by 2002:a05:620a:6c18:b0:949:49f0:3adb with SMTP id af79cd13be357-949ba81a58dmr698065585a.3.1795211058306;
        Fri, 20 Nov 2026 13:44:18 -0800 (PST)
Received: from Mac.mynetworksettings.com ([2600:4041:5c28:200:a4d9:d040:5fad:8738])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949c555faf9sm170267385a.0.2026.11.20.13.44.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 13:44:17 -0800 (PST)
Sender: Andrew Stellman <stellman@gmail.com>
From: Andrew Stellman <astellman@stellman-greene.com>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-afs@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] rxrpc: Fix RxGK server to reject an expired ticket
Date: Fri, 20 Nov 2026 16:44:11 -0500
Message-ID: <20261120214411.44916-1-astellman@stellman-greene.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179520152436.3135.2656252511958141770@kernel.org>
References: <20261119184541.26343-1-astellman@stellman-greene.com> <179520152436.3135.2656252511958141770@kernel.org>
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

On Fri, 20 Nov 2026 19:05:24 +0000, netdev-bot+sashiko@kernel.org wrote:
> This check only works when the ticket's expirationtime turns into a
> positive number of seconds in key->expiry. Two cases get past it.

Both cases are real. I reproduced them under QEMU with v1 applied: a
ticket with an end time half a second before or after the start of 1970
gets a connection and a reply, and one with an end time a day before
1970 gets no abort, so the client times out.

v2 compares the ticket's end time with the current time before the key
is built, as rxkad does. One check covers both cases and a normal
expiry, and rxrpc_preparse_xdr_yfs_rxgk() is left alone. I'll send it
as a new thread.

pw-bot: cr
