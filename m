Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795851623;
	b=NzDz0TPxgsSh4lr8kOPViOLHpv2BWVY5QCmQAq3UUgMZfb0+lYH9s0TCPkxw7/o2a9Cd
	 wMjTsOPqNRaddkQctd7qCo8UaAZBehFPkfp+Bg4sV6r1PbnVlm/Nctkbghwd4iJZeXTKm
	 BJ/n4Byl5hyLQNTAl//nX9qpYeZz3dFwPZbQPS615DyCQKpI46mZOd3cAMSb3VtGJrVgQ
	 66xi3dQJRPPUVVIu/YiH/xmVll2kay4TNgFOtM345WvgCFUtU0jYn1iPNHyrlUznDueDC
	 TCKkGdE+6adPo9EM8eGxTFLoSO6cBQR5anNahWqlWFkallyHO2FQpuSzziFGdm0H/AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795851623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sWrlXEvllKA5pRtJLqxc6tJXfxKMf5ArtU7M3EbpoFc=;
	b=OOcIZLSgNMm46HIYPYKLuNkXHmd1TJwoI7So4dD2i9r2GVA/zxAmvlATfy+ReXlkYTDA
	 q9Yb/7q8m11GsRlT/g3QEg5R86DQQDQlU9MGZXAHnn34CuBbQeNJuwhSUjeCh5v+Su8Wk
	 MLMVwU52ra7WAaz/HhY/OO8TgdVYtSLeYfq65ZIKpnFjMTrLj0bN0IO5xUoT13Eqf09wI
	 rQKG8eNZEajp8093SRjScWXTaFzeYWs0w9BnwZuzbbDNF0hvAW40FV3tsIMLXD9PtqxG8
	 6e9YWuWXLxovbdgzjnrUfWWM1tvivgEm3g5CVZLOCg6bNBjv9uT5ZRCZP6B9WmLW57w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DFIh3W8+;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3213606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 07:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3213606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DFIh3W8+
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so8607976c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 23:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795851622; x=1796456422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sWrlXEvllKA5pRtJLqxc6tJXfxKMf5ArtU7M3EbpoFc=;
        b=DFIh3W8+kXLjYiv58MMtZtqP+rpHM7zi+P1jfsClK//1vz4QCgNdPqWmHCXJsNpgcT
         3iizt32sJnrU/flsacMl0bFtyFMYk5komOoIiqBKUzipY0aIU8WLxBimsYaA8LUeIMDh
         03t2Hh/dAFTkf2jxCsrbl2L58jaueelxUnxaMqURu+73UxYVcfkBrCymmindvxa67ojM
         09EBjCjzRvRG41LwIhigMeEV8znmy4PAsxlRkbQPM8d7sHQ7jQx143lfwtT2ISsLeDnQ
         6KORM6YgVC587swDPMQShaKg/j6J58VvrzLhYwtSIVW9mLDFgRcTU//UGSvd1bXEA2AQ
         rDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795851622; x=1796456422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sWrlXEvllKA5pRtJLqxc6tJXfxKMf5ArtU7M3EbpoFc=;
        b=CPrSP8mm1WIzIJUW7pOXuperedbkroxy/7asTwHs/ZH0dqvVvrm0e7d7cZtJuA0Aot
         p6JYpzUoL+2iloNVVrHao0eCqpjL8RQkcKVMkpSiSGVu08TqQcWp704CQpCOE4tNqs/l
         kk2sxGwq9q/PZkKpI6YvaXQZlBuSRwLWhwV2X6RlIR8zaIoSi9Fvv4b/cF8CTB8azuly
         66e2mv7eau9/t+Izv6z1sesfnvrVD7f/Jus49oft5QisvgFJAxe6dthsFc7Z8y6HTW7H
         u4KUZsRoe8TPSyU6HT+vYzk5YXefmELI7qgLaAwBV4MSnSrX/1kRStEWOcDKhGRufadg
         yxfw==
X-Forwarded-Encrypted: i=1; AL+hErHoRgmUEDtWH5+CwOy82rWYiV8WQV+fETVC4DoagULttesr6goRYdd+DDbIekeqfU6EORhCv/eIihXBP2Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7PQ96Ug0vjEmTVvKjNTj8SpVhDmSXo78j5L4quICZuqjmiT6I
	OwuOffcUUfKPrcOhOpVfsuW3HIvVqz7msNE8+ffeqOeemKG9iZcH4a8F
X-Gm-Gg: AZFdTZfHiaq5uSobcvGE93geFbbje3QZ6wpu0Id6vNN30wQ9L3Z2qxwEkAnV/D5nyK5
	QuQDORRfuHnZELDR5OyhkX2OBDy49PDG1fAS0fgJh5ZMBLv3BhCYTEMB28ie8eA1prTY8yxD1+D
	uPkhgAwVkz6eb0htoLrgUHHpqW9nxisGxqKOFISt5xcFjtlIw1EqeTs8misqZI2DzSNHUMpt9ik
	wMhMDDyUvU9NugiCgJAI9DRlkMKsMAnQyKcBKkfCFnS+vjcklIA+sej37CQ+VSXc2G6ftxL8OVx
	rnFEPGD5OLHm7p+pgfVYq1fCgWs27BvosQLMmWGqYIF0yVrYDmbkRRp9trG00AQZIPuNDJ0s69X
	U8x8HJjTesttjN3kRKp3zoHzkNmNsCaW/41gkLNFqkYkPNusEBesjDToFQPONfI4OIfbE4m7+td
	stC0f2Q4HhUxyclen25jfCjCLAd2QSwVlyn2/mGSOS6BPivzq/vpjRrEhwufex8NAtz2BxmQMC6
	RzgWunlS2xwIvl+KUww06Gw/x3ZBQT/GzyF1QihVy88Pf4zhn6Jtys5OE9CzlzNiFPbO0Vdl2rb
	sApL6JTrPex3C7RCgRvsfwRSbYD7wLWCherb9oggpVCrRU1MbuqTwG2HvyKqqFgrJPFI
X-Received: by 2002:a05:701a:ccdb:10b0:1b5:9b36:eb04 with SMTP id a92af1059eb24-1b59b36ebbfmr4118375c88.41.1795851621978;
        Fri, 27 Nov 2026 23:40:21 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm60591364c88.15.2026.11.27.23.40.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 23:40:21 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: Chris Li <chrisl@kernel.org>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kairui Song <kasong@tencent.com>,
	Jihan LIN <linjh22s@gmail.com>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v5 05/19] mm/swap: change the swapon lock into a percpu rwsem
Date: Sat, 28 Nov 2026 15:39:51 +0800
Message-ID: <20261128074003.34128-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CACePvbWriHftZbyJMNfZ-09KuK0ZgSMwxEC2P5Rs_zGAknndwA@mail.gmail.com>
References: <cover.1795439990.git.lianux.mm@gmail.com> <4f355219f202e5fce9e8dac7dee75f3ea7c51d4e.1795439990.git.lianux.mm@gmail.com> <CACePvbWriHftZbyJMNfZ-09KuK0ZgSMwxEC2P5Rs_zGAknndwA@mail.gmail.com>
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

On Thu, 26 Nov 2026 10:03:25 -0800 Chris Li <chrisl@kernel.org> wrote:

> This seems to describe a lock protocol change. Very naive question:
> Where is the matching code for that? I can only see the spinlock to
> precpu_rwsem change. Does this description belong to some later
> patches or state facts already existing in the current patches where
> there is no additional code change for it?

That's an existing rule, not a new protocol in this patch. On swapoff,
del_from_avail_list(si, true) already clears SWP_WRITEOK, sets the
off-list bit and unlinks the device under swap_avail_lock. What
changes here is the outer topology lock: readers such as si_swapinfo()
take the read side of swapon_rwsem, and topology updates take the
write side. It isn't until 11/19 that swap_alloc_entry() holds the
read side across device selection and cluster allocation. I'll make
that distinction in the commit message.

> I wonder if there is a way to forward declare it so we don't need to
> move the definition.

No new declaration is needed. I'll leave swap_info[], total_swap_pages
and nr_swap_pages where they were and just update the relevant lock
comments.

Thanks,
Lian
