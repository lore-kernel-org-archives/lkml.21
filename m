Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795675218;
	b=0n6jEDDlicEWxDmrRYENrsxKmD/elGpb9USGnimQdtgpvFVC23X/xOpPTvN/u7zqC/mv
	 ExYqG0RsWX7H7a4Ayt3UqyxdXHvMj9/t7k+PuKKWmxVWyusCnc0rT6VZNnEO9LfV2UYFa
	 O42HuHujdY9rFD231yY8/RzvbFpdFS0JxVaCtru7OgIVjNU/XU6aa1X16ptZ85nk6fpzb
	 P48rg9QkJcHlkF4EfZOc5pSc0a0b+C1jfnuRERJgq8OnCJRc3iRfWwzU32SASbhvecKzj
	 qo3HCei52rs4XZodfcNub8hAEaHuW4pfQb85r66UMdCeCO9VPTr0DD+kcAI5p6zzb1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=OLlhHVUzzhl/e/Uoj+6AVXD8QxJnJlUHQHiSgSprbbs=;
	b=wjos9yqCXcNal7JZ8fD6qnh+mNI1sXEeZIAFZ6Z+NAOqRef4tHK7lyipQPqI4hX4aE6L
	 z7QcbC5ha3KVzKLYKcVM0sfTLRbjMaGrJ9mR6g2nc3RaQcVt/zr5fKQoXaf3lMqzZqAn3
	 w7GO3j8oC+DiOy2P5KKUQZyTBNsYHgM1dxzPVonv+zOrBI5HAiONWyXI8ojSt9UkgXpLK
	 +jlgPYZT9Pcr04yFaJG0TGWQjQiE20UgL1notHdToDx5I3m0JYpwSRvDSc+Wi/sdgACMK
	 Dut5pqo9+MmecDMuk9hk8DJf/ombjtiVNzht98PWPxmywFesdjSG85tW0xHvwD+BXsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bn6VIDmF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA99606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BA99606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bn6VIDmF
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b88bc47e23so8567764a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:40:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795675217; cv=none;
        d=google.com; s=arc-20260327;
        b=f1h0ZFvbDCmxshawKtmyGrLIxDGIHp3u9EkwNfom1loSQbz5cdU6vMnboOAGPll8x0
         DMPndWeG7impU69jl/r/1Mf5Dv3wSvNjM4rErjS4dhbBajnW+IdxHN1UdpPakNIVXo/0
         1pZHp2fEKCws7oRjAZzfg4aG0Nk3ZTHlAt1YUdqVaIaBxL3ffpc+ZzzeXTtbnW9mIeVM
         rY4SxDEy56CWTzIUjqohMjrNUiVsHHdtQ6uqRpHv2Udq3KHtmMyOfnSKsedq23pW52tn
         pOKonARkGdCM58gHrVZA8TxeTNC4I2G7xBIblq1FkukIqIN0sr42uOWEIJfQWfMLqOXV
         8uog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=OLlhHVUzzhl/e/Uoj+6AVXD8QxJnJlUHQHiSgSprbbs=;
        fh=UlIkgFfgFFSqffsB86PX/21JwS41Pf7zAC4uTsfEuzw=;
        b=qch5MjHCp143pxPuxz9Er3YIJMWvsBTN7EWLzpyb1eiew4MAjvUc1hkWI6FG9456nZ
         kGLNmmwwyTXUja+rr7OE/yAfZX7cQV3euR4vwUjLYM3I4lba4pwSTb3QiqgQ3vS7y9Rf
         aboFrEs9hRt8WZn8ramjUIkxF2M0jh2VR22UFNCprCSZrfm0MinBE0zDWsMi+whIMIRN
         rqkPcp1Q00GCLCOYTIAXffhZYRhmuKrcJ/zbbIyB8FUUwcemkM9Z0sB/z1ctdJ3OeZJ6
         H+E3OpIWQtiP16ZRpQXH1etA3XCUra4OQH7n/qIsk6MamNzPd5Jm0tAnjLrio2/UjnQJ
         By9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795675217; x=1796280017; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OLlhHVUzzhl/e/Uoj+6AVXD8QxJnJlUHQHiSgSprbbs=;
        b=bn6VIDmFclLaHVmyoTcCKsdk376RBGJfQSlfrVnXcOMK0uT2C1geTxawRNtLS2LFeX
         TVj8Vex3qbuWnDJNaX3ddgDpapK56K4dzGr3wQ5tKwCPGw0+zVdFjflahZ73e5ecetTR
         EdZM1Puwg3FnFTlXQ/l/YdBT1YaaJ4KjRkEEN0NkCYD5KfirbUb82TtZorVCofNgS+aM
         tYtKpU5u4YahIEQIRT7fPmZ9q8SUlvt6LhM418g17EYtV2m0KAdR9QPiAEYgZ6fumIvu
         bFYV+kA/EA/3Zo0aIsldyIul8LcC1N2hZVwAdL8GXUE06K7ZyoNzbsrNvcS7qQr+L9/9
         AJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795675217; x=1796280017;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLlhHVUzzhl/e/Uoj+6AVXD8QxJnJlUHQHiSgSprbbs=;
        b=jq52rNZ0j0QKk8JmW1hao9qrC1tEN3Ta00uiEOsVCICkLjyDitBTlTBQlSEXDh1SSw
         3leyUaxWPnHsxeFyme2dK7j4QzR0mebvCHryJMDg1coFq3H19KHkhxLMKb0VFwOIUr6S
         6z69nZiswy41SRzORzNghUix4baucM4R5qgYbS4MczMeb7XgpJ795oyeTng9UxcuRH+0
         Q98I/8ZlYmw5W94Hn/fA1JLoRQ1t+PRCNIP2Vylob6A8rCYDva6qFUiSkllioxpyTKLB
         e1ycaugrnFuCJltSK7lJgme0+QWUAGpsl5H6LNbHOjhx7Ysjesu269aXu5kZuqR66jHj
         q51Q==
X-Forwarded-Encrypted: i=1; AL+hErHE1gWWeoxGhxima+fV3CqKWcRDRbEirtI3qQejlQHgMUB4XK1pzpeisCEC9FUG4EMKsV5aM2cD65VjeDo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DYnnJDnDlvZlFeY6fsanP9L1viCqKtNLMla1WxxP2ConjrSYB
	CrUcLHacxrVncSUbfTptLOYvGpbBu5uj6MRb9ou74k+tIV/6q4lZGE+pVdvgwiHEjr3lMXaq1qF
	A4PPLbuaqTWeMv8K7qdPLRwKPT6RduDSJEtRWhNM=
X-Gm-Gg: AZFdTZd7c8u5pL4aoFqQGuporfhe033xdNSAHPP+iJzbrEOmJ8Q++gi8rQMc2LdWVI0
	2hN0wXGAcfvlKhaj5KNMEXnmQ9YIO/C+/nTmEZMMgK+xV70d9B2PmRGPoJOXC7vWQH8FElLp99l
	GXNcFT6n8tH8EsOeliuKXKBkWVCI+PzUboGsyRU1+5JK50KVln3PSkM0ZLEMoOCSLRl0HwJtH3w
	uRMSDHSy3VKxqW0nHRZSV+kn8ZPq3G1+vEV3eg8Xm4wJT9Ep9PE5hE4QA5GM/IUl/DHJy42Tc3e
	D/iv59kPufSULVHG9LL5Bf0KbazpB23utdBVtVmrCFCTAjW4egt1JiXjVLGwTk5YTIK+wV7EY05
	L6bofDj6HspkRKQQLP1ZQyKeb51fGL1F7BZOQYHFHBtvzfTlPvpQiE0EF
X-Received: by 2002:aa7:d402:0:b0:6b8:6f88:b642 with SMTP id
 4fb4d7f45d1cf-6ba37ee4b37mr10917094a12.44.1795675216518; Wed, 25 Nov 2026
 22:40:16 -0800 (PST)
Received: from 138594053405 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Nov 2026 01:40:15 -0500
From: kayano050408@gmail.com
In-Reply-To: <c304b43a-0a75-4408-8cce-9f4e6a1c5a59@rowland.harvard.edu>
References: <20261110-gadgetfs-ep0-v8-v8-0-8f90434574fe@gmail.com>
 <20261110-gadgetfs-ep0-v8-v8-2-8f90434574fe@gmail.com> <c304b43a-0a75-4408-8cce-9f4e6a1c5a59@rowland.harvard.edu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 26 Nov 2026 01:40:15 -0500
X-Gm-Features: Aa3M54p_hGWypFvnKMoE7_rRJeDe_ul9O64EUmW6OiF7e0KppVgARtJ-29DtBIE
Message-ID: <CAE2LCh5zMjVTGC3QH6QrMCbG0MhknHLyRK3BB-czrqPXU-C9MQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/4] usb: gadget: gadgetfs: fix ep0 setup abort and
 unbind state races
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Neill Kapron <nkapron@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Alan

Thank you for reviewing the whole series

Regarding how an event could be read after gadgetfs_unbind() has
finished, closing the ep0 file descriptor is indeed the normal path,
though gadgetfs_unbind() can also run while userspace still holds the
open ep0 descriptor if the UDC itself is unregistered via
usb_del_gadget_udc() or unbound through sysfs at
/sys/bus/gadget/drivers/gadgetfs/unbind

In v9 I dropped the STATE_DEV_UNBOUND changes to keep the series
focused on the main fixes, and if you think that external unbind path
is worth handling too I can send a separate small follow-up patch that
clears dev->ev_next, wakes dev->wait in gadgetfs_unbind(), and checks
STATE_DEV_UNBOUND before delivering events in ep0_read()

Thanks,
Jing Lin

On Wed, 25 Nov 2026 22:27:31 -0500, Alan Stern
<stern@rowland.harvard.edu> wrote:
> On Tue, Nov 10, 2026 at 12:13:23PM +0800, Jing Lin via B4 Relay wrote:
> > From: Jing Lin <kayano050408@gmail.com>
> >
> > Several ep0 state transitions lose setup abort notifications or leave
> > the file descriptor in an inconsistent state when control requests,
> > disconnects, or unbinds race with userspace I/O:
> >
> > 1. ep0_write() drops dev->lock while copying an IN payload from
> >    userspace.  If a new SETUP packet arrives in that window, the stale
> >    response must not be queued for the new transfer.
>
> The window can be reduced but not eliminated.  After all, once dev->lock
> has been dropped there is no way to know if a new setup packet has just
> arrived.
>
> > 2. ep0_read() waiting for a delegated control OUT data stage only checks
> >    dev->setup_out_ready, so it does not wake when a new SETUP packet,
> >    disconnect, or unbind aborts the transfer, and can consume a newer
> >    transfer's payload if dev->state re-enters STATE_DEV_SETUP.  In
> >    addition, gadgetfs_disconnect() overwrites STATE_DEV_UNCONNECTED
> >    before next_event() checks for STATE_DEV_SETUP, skipping setup_abort.
>
> The problem will not exist once new setup packets are prevented from
> aborting older control-OUT tranfers.
>
> > 3. Early returns in gadgetfs_setup() on oversized OUT requests or a busy
> >    ep0 request skip setting setup_abort when aborting STATE_DEV_SETUP,
> >    while ep0_poll() clears setup_abort before ep0_read() or ep0_write()
> >    can report -EIDRM.
>
> These should be relatively easy to fix.
>
> > 4. gadgetfs_unbind() leaves queued events readable in STATE_DEV_UNBOUND.
> >    Delivering a queued GADGETFS_SETUP event after unbind puts dev->state
> >    back into STATE_DEV_SETUP after dev->req and ep0->driver_data have
> >    been cleared, causing a NULL pointer dereference on the next ep0 I/O.
>
> How can an event be delivered after gadgetfs_unbind() has finished?  The
> unbind occurs when usb_gadget_unregister_driver() is called, which
> happens when the user program is closing its file descriptor for ep0,
> leaving no way for it to read any events.
>
> And as before, these issues are all totally separate so they belong in
> separate patches.
>
> Alan Stern
