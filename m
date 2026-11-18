Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021974;
	b=gG4HGp+qP+6VxXcuyxiQUlMKRmTRDWDBRb8ax+s6CHuVBlV0hTDABHoWqvk5PezX0d4y
	 VcwsZYUeMrAY7DFfOfs83e2MljjH36nFMJBwmRvI8E8/Np6xkOtoBkLgUl4FbxeaWQVkn
	 1TENj3fJeEJQQP+k5du7fPgKSBN3LZwX1in1H8Ky3LgoMBFchTmvHzYTyA977K4+q4t07
	 wORDdvvnYKwnIo/N0xnt45yLejIEy5xtWjQzwhTvlBtnBhv0EM145rY0rIO9+jThI7JnW
	 4wdFKxwIVfKFoyqwe84a5/602oKjC5MD9aLTF7PF/WXfTDDL7bdP/6IS6shEAmRi9CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Upxleu5PclylbFkFy5/TUrklY/Ium3UhTzAwysVorX4=;
	b=CpmJM63684SzYwi6aoPXqqPibp/BKBwlaAdAwea2dHZvCWKFmc7mYlakquK+0cPNF4aS
	 pSyhYX3IgKOeIImtzafXXgpHUvCzMalRPrPMQn/zcPTwqideMuGu4G0fFyOLYgrJW/tBU
	 JspYwvnl36k4jFodd5Urlnl960ZxRWSbuG/xUHMjc/yy7Zwj2xGz9sJtCMp3ixp922nZp
	 39W2CD3gCZpjqUOeYpWfh4uZwrYMikGmDrTjpHF1hnIxwSuQ/1cht3LF2BVBERdLdNbYu
	 yOnBvRnOZLVdFR5VBz1C+aYw/W4X8FtVr7EbjtHhVw12WVfTZwHvNRKY1g+JkYUn8Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nwyF0PXC;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3EF606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F3EF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nwyF0PXC
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a41f145599so112697f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795021972; x=1795626772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Upxleu5PclylbFkFy5/TUrklY/Ium3UhTzAwysVorX4=;
        b=nwyF0PXCU31oETZBnYGqmuIzowi1kcnE7reNVwGl9PO/qyDB3t+CJ2Wztk18Z6gOLW
         P4Sjf+5tzcKPI/NNskflPr4CXvhoRSFCQIV+bf+ZfgWpzcL5uS7elC1nXdbw4Fp+neiH
         a9/1wMDnr2VlcXUyR2ijr5A3WnCBQjqGAAzZ2Px5kZy6x5OhVHwYC9ct8VslWOBun6fd
         wUblKds6rHuPyygs9ToMQ2pfslUHSwib8ck+xrtqZyCSGnxG3aLOiZiuhY5/ZTWgi0UR
         aLxMRA1WfU1BfRlEemvDHjRP5A7B5jpFWBtDbo3gPvvkM/D7PVv/dKYDHwkanwlwAXSF
         U+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021972; x=1795626772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Upxleu5PclylbFkFy5/TUrklY/Ium3UhTzAwysVorX4=;
        b=TUvWFoC0QjulyXM2NsfZ+EH0YTydsF6uVVpzhumZ5N3/9CNDYq9IO/g7CNBLG3Ut9v
         b0Cgm9NsX9CsaUMqcIFcMyPwSntYuYA4R6L1v3ROzcI3i6olCRkLUtQ43qwAoyyrktpN
         HQCM45841z1gQiqkojkL4xTFBLTO7yXdCEFyAEDgVbMhMphBJS7Iupeu6L8NtBjGSi/Q
         vQGFK1UqxKsRW5KkK/q3AJGT1+TFNa0Dt/lttpouWQKV2P6bqBorAKBFlTpvPUyJ2YhP
         9Q+3E9+aFLSSLTtpZv/92N38XRf/zjkglimsC1zCD/aKInx8ITIduzA79hze3if0JAsk
         ATAg==
X-Forwarded-Encrypted: i=1; AL+hErFB32uQ2yfN5bQeQAQvLDuLCz54SvzCYEwHQPWNQgqiQePkAnrJymYunQun3fnsxEv6EFUOTiVQumi3SNQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2se5RSXMt2VAhBe85fRe1P9QPf54RyLPYr68gms0PRtyd+HeV
	yVhF4hG/NL00X3nnIU6kX36FGvLf2eXXHv9qRU1QJBxARLMCCdUChZex
X-Gm-Gg: AZFdTZe4Ixc7CUTmUYdIKASHNtEMHqBpmQGhIRrQjegio00XiBvuZyQT8EyhDf2oS1y
	KCZe5n8M2ixMWYf9SLqB/8VUa8VCu/0+6+cavTl6qVkgQJmboDPYZQkmpum0OuzZSIZih77yiMO
	sL+94QMdSSFBrf4ymlqssd7uqdEfKtzhETk4ptXArNX6RPYG7Juafydya80r6TW8LcMgWkUeb9e
	fa/ShXdS8aGujjriR8Ne3tla4WhQnThWnXjEaxc+oGNkze7HhqbDTeO36Dxl+AMmAg3Ey0zEwV/
	wAaDih7emajrSMH8/F3Y3frvGuudWybGvjg8eKmxWspYuhKMqg+LtpzYCWKenqB+qYWmifvLDs9
	iq9pTcogseM/r/n5sAa5ZYbYlQQu5q24TJPCQmCfK+xA+DUchUbrVxWfJ+xxzSk8RnBEPjCYTSC
	foApFySG3n5C5oewmI/rwEh9XraPI70Clr9X7W4p/Z3U/ovzVFlpmuuxX8y2chpzw0dI/PQb5tt
	i2VgJGBLkhh11XGAEKTrJMWISXFuc3hUzHR0Mv1/+9woFrM0YofduU/pfMKfB1jn1kWlU0ummm5
	0qWalhmmwgNiTrmT3AX8z08VEct3oXmDjTQastt6CLYhtZ71HNSIyvQTo6RDlSrBuazHJgY=
X-Received: by 2002:a05:6000:2405:b0:4a8:eed3:770 with SMTP id ffacd0b85a97d-4a8eed3127amr182443f8f.4.1795021972366;
        Wed, 18 Nov 2026 09:12:52 -0800 (PST)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6573baa9fsm6313344f8f.57.2026.11.18.09.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:12:51 -0800 (PST)
From: Itai Handler <itai.handler@gmail.com>
To: mwalle@kernel.org
Cc: miquel.raynal@bootlin.com,
	pratyush@kernel.org,
	richard@nod.at,
	vigneshr@ti.com,
	takahiro.kuwano@infineon.com,
	tudor.ambarus@linaro.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v5] mtd: spi-nor: take the flash lock around spi_nor_restore()
Date: Wed, 18 Nov 2026 19:12:35 +0200
Message-Id: <20261118171235.3886698-1-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <DMYDITU0H48Z.2LA5KF2TFNUY2@kernel.org>
References: <20261029210153.3986211-1-itai.handler@gmail.com> <DMYDITU0H48Z.2LA5KF2TFNUY2@kernel.org>
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

On Wed Nov 18, 2026 at 2:33 PM CET, Michael Walle wrote:
>> +	if (!ret && nor->shutdown) {
>> +		spi_nor_unlock_and_unprep(nor);
>> +		return -ESHUTDOWN;
>
> This will be propagated to userspace, correct? Not sure this is a
> valid error code outside of sockets. Maybe EIO?

Yes, it reaches user space, e.g. through the MTD char device. v6
returns -EIO, which is also what the CFI drivers return once they have
reset the flash for a reboot.

>> +static void spi_nor_unlock_and_unprep_pe(struct spi_nor *nor, loff_t start, size_t len);
>> +
>
> Please avoid forward declarations and move the functions.

Done.

>> +	ret = spi_nor_prep_and_lock(nor);
>> +	if (ret == -ESHUTDOWN)
>
> This is actually really hard to follow. It's tested for even before
> it is set down below. Also probably wont work with an EIO return
> code. See more below

Agreed. v6 tests the flag instead.

>> +	if (!ret) {
>> +		nor->shutdown = true;
>
> Why don't you set the flag unconditionally?

No good reason. v6 sets it unconditionally. When the lock could not be
taken, another operation can then read the flag at the same time, so
v6 uses WRITE_ONCE() and READ_ONCE() for it.

> So why don't you just keep spi_nor_restore() and just add the
> locking there?
>
> What about the following:

v6 does that, as in your sketch, except that it tests the flag before
taking the lock. Your order works too, since spi_nor_prep_and_lock()
fails for a restored flash and releases the lock again, but testing
first does not rely on that. Only spi_nor_restore() sets the flag, and
it runs from ->shutdown() and ->remove(), which the driver core
serializes with the device lock, so that test needs no lock.

One more change in v6: spi_nor_remove() restored the flash before
mtd_device_unregister(), so with the flag, the unregister could no
longer write back data, e.g. mtdblock's cache. v6 unregisters first.

>> + * @shutdown:		the flash was restored, refuse further operations
>
> shutdown only covers some of its meaning, it might also just get
> unbinded etc. So what about 'restored'?

Renamed to "restored".

v6 is out now.

Thanks,
Itai
