Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795359210;
	b=crbfKHDDoh2hiZ16lFPD50hftKkus8qIaay3NJu/cujUuYwYXLEGHuXRUfYP/c3ymNFS
	 RsuwCwdQbMqhu42PLbcNqdcFA3ZOI7kejZthsKxWq5EFsGSc5yCGCGZA4CjOoSwMs++8I
	 lliJaLzQwLSpMMrvYQ+80OwVPwMu4mUXJWmcp4izad9Ozf2RfAx37PUzvZWV2RojwSVYv
	 3btePCtfIvSS0ML7rcrfMvwhjVL+WjHgwdXquIapXtQ9w3dN8FJRCCTPsedGfXtHH7EBu
	 fIslnV8dXjKRGn1QUJR7an4QHnPDQ/X9XAzCzG+F+0DhiZxbu3etM+9p9YmGtA3Hydg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795359210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=EMg9eBblftcqvgfqSOCJqwI/WbN6M2N5ULmdtflQO10=;
	b=tQxH7VxOVvwcbca6/9aPYJf63vpRXZvleZ+BVJ8ALof9YcqcCB0HCTf8Mcn8ikS11I+I
	 o28roGvnGvwiU5qPnqMgk0BWJFyZj8Bx5EsjCxSQa41tLf7wH0hMFxdh5+V0mgqMSbF1J
	 jTHMxIdLKoe5fbD54PNKrnbfkhFDhU+7eU9C37xyARHMD6WZFt/3xgTT/NwVJI6QcxkyD
	 CSsCVd9xYb8acQXvdL2s7XK73a9FRGjeskpQlQVGNUlECidMvYl7vnsKoL0Tfw3aThBvo
	 2F4J7xy7kxAcIDcGqgEo1TxpujxkEciurvnpNQrjS7t0XcPEWtepuvdN3SXJ2WcvViw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=CJGTpRWZ;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913AA606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 14:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 913AA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=CJGTpRWZ
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-55b8cd4e2abso29810881cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1795359208; x=1795964008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EMg9eBblftcqvgfqSOCJqwI/WbN6M2N5ULmdtflQO10=;
        b=CJGTpRWZ7MB0kqT+KQmoAZZ05PqUN8xlrDUyUH+gA9dQc+IVgh7WYUaNUkwrQwZAZ2
         ChpqZeQ+CYR9Awi+y3E04E6Ni2OC5AYQWyEGoeOv+hRt8ClNtUkW/ZdW8jqnJcGZ8tLF
         An1XXfGomIK0ppeaYoOVRw5pr5mzk+24zHERDN4X59UjldMVQrMnHp194pbUuDo5QTlr
         wiC3XOeYPv/hLWZ8h/AigmfQztx0BK7EzHkpRQZcePV1Uqkj67KpHVauF4phFnc/WiQ9
         pKWRwTfkMPfoGr18gC5Khgrq7y+4LGaouaiuYr6v4QA2tA+9VgDBCnJBpMjqHoaRlHF/
         Hyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795359208; x=1795964008;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EMg9eBblftcqvgfqSOCJqwI/WbN6M2N5ULmdtflQO10=;
        b=FiVHl2sQYM9mQZ/QwAp2dFt16ZbTNQclAXoNvyjFZtbXinxHIPZDbySLGT4zWJOApY
         gs5SVYKxLjmZkeQos2wScqgWHmOFcyfHFmes21Ox35Ha1TLB/AmAr+bwDd0Ll5yV8BVo
         eSIO6a+aOUiHoXEDMkGK5XX/cm6w3xvbcrt/xJ09x/8tV2h0XUzJO6zndmaRZ0xxLNP2
         QXFrf21zkfhlhuGdXTb8HRzlGPuxGFrkjjfCrwdKle5tuPZIsTSg6AZFekW8Ta054PH/
         sr52gzL5n+L5cJ0UF1jFBAo1HSpNpP2FQFSvb69JvskfJeKMansCfkhoIFAVdshhzhy8
         Um9A==
X-Forwarded-Encrypted: i=1; AL+hErFf2qXwuMPT47iJ1tK+BaLGunHcZ2sNbo8nEuIjVLA/1xzfuxLddEf9HcWLeE8R61zRSQF/mRt8bUl4grI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iaFzsPww7kNkkSjdojo1IMgv445uY8a1Uk15YGr+lY+Vxh8EA
	bhAODzbfHWxK02G480bfrn7SjLqdG+OePs6IjakbeM2gGgxKnHGRBpx3YQLzG8V9QMAimiqKw6H
	m/f+6nQ==
X-Gm-Gg: AZFdTZcrxI3ER8hEu5tV7SLE2bwBglBqTtl/CvZ50nlVIAuSh59DSmymPc/FIXMND8a
	PW1XLhHymoPqBM740ZAaP7HRnzDmHNpfPUWkYQUWqQK44LCV1SGUBBuyZFu1L4sbXOuyb25ACZ3
	zrDRfx0vJ9Tuc2e+WWjBnd0L4YwQefPjtnHofjmd27+4PzpEayottat/f/nESiaE94mWXWPwoEd
	fFGnckBqjj2OTmMj2oG4nu4Mx5iyjF/Vhhee6s7zU1GqOJcKD2AEwFp/ZKQxh3GePWhcJlw5yai
	d2dJvp3qa40lGiRkhw5pavmQxNRd5k/3Nz2/8m1IxK8+IdQ0mRXoRnPb2yIcqo536SyCmduYFKa
	0INcv1z1NGgyNGUQdrgEv6jJcyD/8COvs2vGCkty/eFLeCXvibz7Ckgx0wYrV9yaWvegj98wgWU
	TXGX4CHmK62i+Gsli8vPCJWuQIZ5iIoYScC5odNEP0YfoZ66YgvChHfXp7MyGZmBvn5ky+aFiwh
	m6DXwCI/9sXJxzWysA2u/wPR86smwJznK6mgTPfKdLjdZmZK8C1bGvHQ9mevADQg23uHR6KV+YQ
	+dgLcPsB/CHRocjdEvnC9oiyVmCemA==
X-Received: by 2002:a05:622a:514a:b0:536:61d4:cc6d with SMTP id d75a77b69052e-55d76af2778mr156555621cf.53.1795359208144;
        Sun, 22 Nov 2026 06:53:28 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::d398])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134bfe82dsm78713746d6.0.2026.11.22.06.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 06:53:27 -0800 (PST)
Date: Sun, 22 Nov 2026 09:53:25 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Arbab Haider <arbabhaider649@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shichao Lai <shichaorai@gmail.com>, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
	syzbot+dc208a8cf8d37cf3e5ac@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [usb-storage] Re: [PATCH] usb-storage: alauda: track
 media_initialized per port
Message-ID: <ac19e630-f96a-4144-88dc-e3f22091c7bb@rowland.harvard.edu>
References: <5d2e1310-88db-427e-ace0-c2a0590560b1@rowland.harvard.edu>
 <20261122080550.2181-2-arbabhaider649@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122080550.2181-2-arbabhaider649@gmail.com>

On Sun, Nov 22, 2026 at 01:05:51PM +0500, Arbab Haider wrote:
> On Sat, Nov 21, 2026 at 03:54:57PM -0500, Alan Stern wrote:
> > Has this patch been tested?
> 
> Yes, tested in QEMU (x86_64, v7.4-rc3 with KASAN, UBSAN, dummy_hcd,
> raw_gadget, and usb-storage alauda enabled). I do not have physical
> Alauda hardware, so testing was done via dummy_hcd + raw_gadget:
> 
> - Before the patch: running the syzbot C reproducer reproduced the
>   UBSAN division-overflow / divide error in alauda_read_data()
>   (drivers/usb/storage/alauda.c:986) on LUN 1.
> 
> - After the patch: the syzbot reproducer passes with no UBSAN, KASAN,
>   or divide errors. I also verified additional raw_gadget scenarios:
>   * READ_CAPACITY and READ_10 on both LUN 0 and LUN 1
>   * Media removal (status 0x80) followed by re-insertion without the
>     0x08 media-change bit and READ_10
>   * Media change with a failing alauda_init_media() (unrecognized media
>     signature) followed by READ_10 and WRITE_10
>   * Recovery back to a valid media signature with TEST_UNIT_READY,
>     READ_CAPACITY, and READ_10

I asked because when syzbot tests a patch successfully, it provides a 
Tested-by: tag and asks to have the tag included in the final patch 
submission -- but you didn't do this.  Did you run the reproducer 
locally, without using the bot?

Alan Stern
