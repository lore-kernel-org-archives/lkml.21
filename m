Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795365146;
	b=uMvMhTCnJ2b4h/yW/mjKcsuEoNlHB6NasLSWQqosKYDTknSjF5lCZCq7f3wKVpr/rpaR
	 Ji/yXNLmahdATrTbb6OklOWoAftBmXWV7U1Do48h++r9krv28TYJFBZICbx+62jSHJirJ
	 /bC5Yi7yr/LpTUK06marEEdnsFF1W8HYeM0TzaqlWYZNXNsNVIp3fqw8/I4tUt5osxWMe
	 /Os+LqQlmAiCQXSJzF4ciFED32/unbjQyEZrww4crUh6qX1GsGTLOtLooFnlIT02wIUJn
	 Z7JCZCs8+udbD6BEZmzjE/0sVnmS+EbIgBUBo2O224/KHtFPR1T1mxREl3NfBHt3RPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795365146;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Pr+dsKJZZmj0Sy+D9tP4F757fH6cOOhvNvvKkgik2XM=;
	b=Nm9uI0iFrq6Wgpk3aPKyZcjVDcxQFcHIbKLJglzqjJwK0x7sjC56dgDHkBxi63Fr2+rj
	 598HIBRRKQx/yUWanfG01G1jyPgcfHhoIsx3WQMV/9xS4ZNP6KraWKNhgQ8KRAAZo4o26
	 qLTj+1kkx7cqX7O4SIu2Bd97uLkPOzrvwlfsJK8b74utQAD5iJDsY9EmjG61cg6E0RPKP
	 zT/r/DSJz4++xEVrXCOxdR97MrIpQVbKe+lUgpRZzdu8VU5MHVSTzIlNWoOXTddAQAt/F
	 fY/beyoOXuGq8vJZK5eoA1XK0BB/hR+zpjCN1i4mFiGA3VtNqpCdn2oal2Jgl0z4ZHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YCcKGQuB;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UNUhIYFS;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5DF606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B5DF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YCcKGQuB;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UNUhIYFS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795365144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pr+dsKJZZmj0Sy+D9tP4F757fH6cOOhvNvvKkgik2XM=;
	b=YCcKGQuBry0QJkJqOufV/XieYIqC57r8E3czdphV7NEAif6oOb1wZveTzPDnlKHonEv3C1
	22PLSPdqqlWinYbdiQXMkFaAmHw42M+JdCQIgw+DkahrZnC/Ge2JesZjvkfJT1TPZf7hHJ
	rmWDLbn/LIvHACJuEERIVQiKES2o7E4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-tnPv-ihBOYW77-DPf_8yPg-1; Sun, 22 Nov 2026 16:32:22 +0000
X-MC-Unique: tnPv-ihBOYW77-DPf_8yPg-1
X-Mimecast-MFC-AGG-ID: tnPv-ihBOYW77-DPf_8yPg_1795365141
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4915ba023d4so1501275f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795365141; x=1795969941; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pr+dsKJZZmj0Sy+D9tP4F757fH6cOOhvNvvKkgik2XM=;
        b=UNUhIYFSN5oC+0imfza8J+QxuoDyglMRphWMrKMpBy3DSx4p19XC6+wUzohrDTScNe
         +tdwcfjLnqu70mwFAIpHvaMOfPbp7C8InzE4m0GX3ZLY3wiI/OAe2wMaJzKgWNAJ/+rj
         81qIjzC2lAvyakHUTcMTacQbImu3C+eCrMR7Dy6yoA8taSZI9kgYtwMj5etRUBxXpOOT
         tKdFyWRsODeYP5PW0+H9Yun906mSB39jC3660i2StkqUYw7wA7sbCJMJ80QlH3kzhoyc
         /0tLvD3tmnsj6Lyvs/p4lErZ+mL83hWZYp1IsKP5OsAnP68HmXWYD7yJQoNny/RTbGB0
         qcJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795365141; x=1795969941;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pr+dsKJZZmj0Sy+D9tP4F757fH6cOOhvNvvKkgik2XM=;
        b=oEtI9Jwc32NXazwC5G27mYL/QPgIDAfSjkJN1lb1UUliP6EzCIxGbwUi6SYRXOtCf/
         xgawM5sXF8TnIlLGMQhgdBHp3rMk1b3djXHN+6vNQJ1IZigMZafEw16peYBVGrX6LQia
         TEy94QmMaqQ8AvhnNvMFLO07r+f7gUvjN7eMv88P4bWudbmZIEW5zPm5YeNRVmdp0+BC
         Yi+nPLJOoHpdSWkdz+M2BQ9+BYvkW/O/5l59iup5dH5EfHNvL074Y3tJK+f+fp6TQK/O
         JiABy+QKZjVKbvXSkg1gHeg0ENzqX5vdFWPoQLqHdqrIaTFzD6NDtkaKHPx10P7e5yiP
         zjKg==
X-Gm-Message-State: APuU4Z+VibGsCoh3pMDi45h5MRZEetB8Zfl3OF2DAbHLzFaNlAIhbxeM
	sXHyfO46iz+tTM1UovKg4olnbzesXQiYC5Vv95yUZC4FY/7KPHF3w13pR4oqoTb2bgbCo1vWR2I
	MOIT3fbmBBP8cprZCWTo1SR5YuJxhcS9K9Hu/b7Ww8+znswwtxCh+pJTIWlGq65TeCXQW5Rz/LU
	G4+2spVNHyhOUHai4mEgRvuYohkFNnn/EWyehWjZjW+B5KaObA
X-Gm-Gg: AZFdTZe6X88n7iXHgI4iv69A3aYrsEk7fgFx2gzd0ZqkKEfpwU7C6MRvv4Lv3wsPfZb
	0Qq63Xz8DSji7o+D/D+YfH0E5lHxOCHf7jo4UvxyD0dryi5jDnjW0H1DHCmUoj4Z09cSd6onObm
	kxzkLDuCS13gRMiCwmWoc2o9sryY+mc7mlXExdqUB9uk34DQboBFUh0DDTCSLxgTADpaFSWwRCG
	InK9wDhcjrZmBHtT5xC8LjzhJNiwZ8ONWSx4ppTHtoAP7R5viBA08S/CHHYf//b1ZF00ZjWgNvg
	3RvSiOxtAmmhAfVD3QI9jyO9QAuv7zoebLA6nLH/Q+wfN9tbmR8RBk/s+sw/UxIk7nMENwGitFa
	QKEayC1gopAPyH4OV5Mi1hNTJ8HmHmzLdvD7nGybKjWCnl4+nGE2V8gZpFstA6EdWP6DROMmVIk
	9f3k9n
X-Received: by 2002:a05:6000:4006:b0:4aa:2bf2:4d9b with SMTP id ffacd0b85a97d-4abb4b864f3mr18914479f8f.44.1795365140962;
        Sun, 22 Nov 2026 08:32:20 -0800 (PST)
X-Received: by 2002:a05:6000:4006:b0:4aa:2bf2:4d9b with SMTP id ffacd0b85a97d-4abb4b864f3mr18914451f8f.44.1795365140450;
        Sun, 22 Nov 2026 08:32:20 -0800 (PST)
Received: from [192.168.1.86] (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f281sm16332717f8f.22.2026.11.22.08.32.19
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 08:32:19 -0800 (PST)
Message-ID: <b447c087-292a-400f-8082-56d509f6a9b8@redhat.com>
Date: Sun, 22 Nov 2026 18:32:19 +0200
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
Subject: Re: [PATCH] mm/hmm: account for subpage offsets in device-private
 PMDs
To: linux-kernel@vger.kernel.org
References: <179342234355.4.16705453209886955762@gmail.com>
 <20261121160037.1a479f3c8b4e860bc23c106d@linux-foundation.org>
 <36be0904-168d-4813-82ff-27ecced464e3@redhat.com>
 <20261122015246.d8b6b98ff5a8157168156339@linux-foundation.org>
 <179535872126.34.4789080961796247940.b4-reply@b4>
Content-Language: en-US
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <179535872126.34.4789080961796247940.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/22/26 16:45, Aveline Noir wrote:

> Hi Andrew,
>
> On Sun, 22 Nov 2026 01:52:46 -0800 Andrew Morton wrote:
>
>> Store the corresponding RAM backing page instead.
> This avoids the oops on the first read through the second descriptor,
> but leaves a stale backing page pointer after CPU faultback.
>
> Since the mirror XArray entries don't take a page reference, they rely
> on invalidation.  When the CPU later faults the page back to RAM,
> dmirror_interval_invalidate() skips MMU_NOTIFY_MIGRATE for the same
> mdevice, and dmirror_devmem_fault_alloc_and_copy() only clears the
> migrating descriptor's entry before the backing folio is freed.  The
> second descriptor still points to that freed backing page.
>
> Reading the same page again through the second descriptor in QEMU
> triggers a KASAN use-after-free in dmirror_do_read(), and the read
> returns the stale data instead of what the CPU wrote.

I think this is right, but a fairly artificial scenario: it needs two
descriptors open on the same test device in one test, a migration through one,
a read through the other, a CPU fault back, and then another read through
the second descriptor..

The fix lets the device private page content be read without an oops
in the context of one fd which is an improvement. 

> The second descriptor's entry probably needs to be invalidated before
> the backing page is freed, and it'd be nice to cover a second read
> after faultback in the selftest too.
>
> Thanks,
> Aveline Noir

--Mika


