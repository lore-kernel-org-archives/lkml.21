Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795356408;
	b=yg50278io2nf5mNkxc+llHtFDJKqLZckwvjPHPi+lGqmyOXVDoV3d30K0HefY8LG20Va
	 dpNiTdQw5mn3G64ta+YKn3b2nsC6OxMlshfo9hapZdO8p0obqCRLr0/B4pv5hanHh6igU
	 r94WEvWvcX2Dkxw1Xs4nnNR0aWc0+LYUqbFHHeQ2UODpBDda5wWCij0UUKUjdSpM55cfc
	 9f6KtP4z6ujgptccSfsXNF1po0MZPuSa6bha88JcqkWdg6ig5rYTdDid9ctNNOxsKSY3t
	 vVJ4xClLkHddK/2a61POmoj2KDUxwy7rb4+d/EY4H2ktac8ZkwYXKz2NUdp2Sg1hd+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795356408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2P7NnlFD6hf0e/Q9nUMush5WduoVnm93NdkP6w446kQ=;
	b=oU6F3PiWnPOY/QAkAwX5Hp4kuOieQ53aJShydi9Hqkz1XaXhDMuXgg1eoUaorN1CPBo7
	 i+iUdeULiKi3ce6jJtHpwt02G9zjeLaCOVu/Vs53jW83ehGbosk4RzYj0sEL0mAifXI3m
	 angQ4XAm0ANfp8W9EG7grRKfAdhDC7dJP5eDWZLXLaITMZvZ+e60IJNK+0I9w7CfCGJpM
	 rnGBDOGqIKR7kyrheCv1ilOrMxLDUxdxU38tNRRDtNE1rWUUXNmHOkmWxjNCAOyOmd0SP
	 TbQB8a6pz7KT/bj/zr1hWKSOrD1IZFqT1qswtyLh2+MgudxoFlOnYKxu9HVZQnGWQjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=jd6ioXn8;
	arc=fail smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F624606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 14:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F624606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=jd6ioXn8
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6baa6f27904so283185a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:06:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795356402; cv=none;
        d=google.com; s=arc-20260327;
        b=OGzInuSOlqOhtprMOcxPcD1CZ2OwcgZVHwYHbI3uqtDlRgIrPqcRxJyjZq/bddD3/O
         0KM7bns0hQHDs0Vka1rArOUQ9Ol+9VD8oRmAWWmUV+EgKqGnPM+yKzAsrL94rv4wa4Mr
         k5c+T0nu2l/Wj/U7k1Zscc0ld7MqAK3rvxAdEscJ6cpSq07cfWrH21Fdej9R/Dm3oLMN
         vpthVxf3fH6hE033+8INqWFM6HzW0pWtpJ3Jqx/HKg/fVVB5BL0onhUZJdb/In0FzhRa
         hY1Y5xV0asejRjYrJPlAnHzVX7boR976PtFWTBImlfgw8nnG12myKbNI7QOKoIzTEydH
         uPEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2P7NnlFD6hf0e/Q9nUMush5WduoVnm93NdkP6w446kQ=;
        fh=B9wZKSEQh4Lw7oJeCBbC4LNAN2fU7bIhFf4Oz4XcKZM=;
        b=eP6KiczbnuFDV4gIaC7r5dNqCAMevtETkh44nZMRgFdbj6J+YutdX7Z+uTmGqaLQOQ
         elFwPkYdjJIkKeulqIugSSY5g+fO4S3eGzRNKESHDMOwXVRITotUxSmApjgfepU+NdAp
         hkLXwYIXlk1Z1/2IzJ3Ql3o6OdKu4t1SnPXQdfQqD6ant03js6++DH5VA895cfD89F6C
         7a8Nf0FQjv9/BFG1Hr6Ch0Ie8hSDJfN2+4/dfMfDptRvzzeRfsmAoiwUQGwBMv/OLnzr
         xinl4IMGGB8VC2aVwviQkm/3/aIdQ0hAFV3IuPgfJ7h6p57QVgoSV4Jbz2DMnRMjsnr3
         H4aQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795356402; x=1795961202; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2P7NnlFD6hf0e/Q9nUMush5WduoVnm93NdkP6w446kQ=;
        b=jd6ioXn8/jtSW042HF6KtWbUIW3aLVlunRvtvFxC7uBtabqLQOB56p7GCu61HgF+jL
         4ERHRbTjMX6muoegMifIFXfcQpMaYLcR9pm4TCKCc9aC1Ms59nBdWl4/K4XAtvpmeVvU
         7vZ2oZxiLbMOCF+o/7WrDrg7xXGtpTH1ohREQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795356402; x=1795961202;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2P7NnlFD6hf0e/Q9nUMush5WduoVnm93NdkP6w446kQ=;
        b=viAvvTMwc4Te3Za76aD6nZ8hds34aXRx4YdsI6tOgYfJkeAWkDkz6EvJNsk6oqtU2I
         2MKIjmlhn1YhZi28uGWpwyR2BG14R5AKGh+M68Kriv1hOUAKz6FV6X0UQaSMEdmnxPvW
         fpa1nQIvGKCXHMDaivPbxaDqmh2iA+HUnGuRP363GnNKztwpCQjJFVsKrDWNhSl814DF
         bJm/KtlC3TynnjWf5vaYzKIVY1Zal1DDUXWKcUT5n8oEE4H5UKmWxYEdjrtEMdr+ypi5
         0luWf5Xw99PJafXYRGmG0q26tt9rbOfBjlucGWd/XWga/ody3rNAX8wfhGg0oIxnXCHu
         +AFQ==
X-Forwarded-Encrypted: i=1; AL+hErH0pSUPY/XrdrE3JfYNlQgzBr5xgzqQKrhePoKLt/1koz6JnjXVp3mK4svCKQPme/FLzHhAMTkK+dWBDME=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SOHdSAu0PyyTk1LcFh1Gh+mNpAQDR/1e0HZ5AWW6LKiCVk5yo
	X82OZ2mwXiZImkzuQMKCFj8KFz6qB+8jwvTJ5n2CeR9wpf+4AbHbjkYH7+13xtlhoOKKt0LmWg7
	MDufGuFpXbs0cP+at5s4rdwE0H4jA2ytzleGxfyZ2Wg==
X-Gm-Gg: AZFdTZc38v10LbYhwWkZyQiq6/1d7YgvE18hbXZHVpNUjkqdgfhiv9Y/JxAIMPkZYq4
	5kG4bpvmeSDEC/g/GHEdPaffo3A3U0Zj3NqyvLiec2qe1muHcKDpifG7iH8KaCvXFMzVxu+fvSP
	TJAwneup9wnrqZKGGQQyBzJDOvLSUMxaGMN2hfmQ0T2YX0rNwvsNiCAzrsjlCS0/31fw7uJo7CS
	BPSy1hWBuZ9PnOSDxblQJFZ6l/BsXLoETQorym1YuLpm1Ax+NY3C6SjKNuyW8HIpJADW/h45Rrb
	opnZKboccZtfp1o4V1yfGpPE5h+PfgrT47wCbf+SF+dJLxYu0kJJVMY5iySba8UJ8PeLYrFULMU
	aELzI3OrsVuOGMsscg3pf4y0udQu3GDU5+2CND+j6fH4oA3t5PlyxD/sQ3NHp51YpwnTEjVxBTt
	Ax2vxqwaAWywEXvXzBBQ8ZmFidHkqfi6nSzJobPexU0E80WIpvFUBeLWU=
X-Received: by 2002:a05:6402:274d:b0:6ba:92c3:fef7 with SMTP id
 4fb4d7f45d1cf-6ba92c4088cmr1355074a12.19.1795356402046; Sun, 22 Nov 2026
 06:06:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122042120.2430434-1-piyus@iiitd.ac.in> <awLwiDzVpdJOr6BZ@linux.alibaba.com>
In-Reply-To: <awLwiDzVpdJOr6BZ@linux.alibaba.com>
From: Piyus Kedia <piyus@iiitd.ac.in>
Date: Sun, 22 Nov 2026 19:36:31 +0530
X-Gm-Features: Aa3M54pNcRlGq48LgyU0hvUMf93COD0ltrBkDDB650T83qW9BEt14_13yQ0gDU8
Message-ID: <CADq=QSyGfZBpziK7r6KD8mm1_0LRO4r4tAKe8gU52Fm-V+DHsQ@mail.gmail.com>
Subject: Re: [PATCH net v2] net/smc: validate the peer's CDC cursors against
 our own buffers
To: dust.li@linux.alibaba.com
Cc: alibuda@linux.alibaba.com, Sidraya Jayagond <sidraya@linux.ibm.com>, 
	Mahanta Jambigi <mjambigi@linux.ibm.com>, netdev@vger.kernel.org, 
	Tony Lu <tonylu@linux.alibaba.com>, Wen Gu <guwen@linux.alibaba.com>, 
	linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kapil Vaswani <kapil@presceralabs.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dust,

Thanks for pointing this out. I checked that Bryam's patch indeed
fixes the same issue. Please drop this patch.

Best,
Piyus


On Sun, Nov 22, 2026 at 7:09=E2=80=AFPM Dust Li <dust.li@linux.alibaba.com>=
 wrote:
>
> On 2026-11-22 09:51:20, Piyus Kedia wrote:
> >A peer's CDC message carries two cursors that are offsets into buffers
> >described on this side: the producer cursor counts the bytes the peer ha=
s
> >written into the RMB we published to it, and the consumer cursor the byt=
es
> >it has taken from the RMB it published to us.  Neither is checked, on ei=
ther
> >transport.
> >
> >smcr_cdc_msg_to_host() and smcd_cdc_msg_to_host() copy both into the
> >connection as they arrive, and every later user treats them as trustwort=
hy:
> >
> > - smc_cdc_msg_recv_action() adds the producer difference to
> >   conn->bytes_to_rcv under a comment asserting
> >   "guarantee 0 <=3D bytes_to_rcv <=3D rmb_desc->len", which nothing enf=
orces;
> > - smc_cdc_handle_urg_data_arrival() reads
> >   *(base + conn->urg_curs.count - 1), an unbounded index into the RMB;
> > - smc_rx_recvmsg() clamps only the first of its two ring chunks
> >   (rmb_desc->len - cons.count) and uses the remainder unclamped for the
> >   second, so bytes_to_rcv becomes a copy length;
> > - smc_rx_splice() walks PAGE_ALIGN(len + offset) / PAGE_SIZE pages call=
ing
> >   vmalloc_to_page() without checking the result, and get_page() then
> >   dereferences NULL once the walk passes the end of the RMB.
>
> I think Bryam's patch is solving the same problem here:
> https://lore.kernel.org/netdev/20261112-b4-disp-0287c16e-v9-0-e5e8fa68817=
7@proton.me
>
> Best regards,
> Dust
>
