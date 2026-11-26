Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795675570;
	b=NQLSmNP7PuD/s5qOwyYJgl+u3jb1I+ovpQUbOkcNrJbUNArDhYBge/XaXVJyEk2ml0h3
	 uuNNeaiYXpWLMJ2i1JHaq22pfLKJY9an2DmPNBQJiz16DgyjfN6XMq32iNeO0Owl5Y2Hb
	 bNcMhnGR4ijKDxIdWFLx4F4erhBwR1y7O+FcuOdwChNjIiSyzTqOeevQ7i+MD5iQqIJAV
	 1j0Bf4S+XKTg/uTQiCtAyrWCmyTkrIMUtckdsmqWp2CWQlSLD7KM6NOwvd+6CPuHZC8oH
	 H7vfL9TCt88I1ZwbQWEkObJApkJ74IdkBhGZmyxw5faQ6z2X+xJHNkb34E7ZhatgTxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=iEdrgxs/YidBZzZOj+WIohy33aH+C5/pNi1p+tZ06Dk=;
	b=BLykf9k5dEgVg4FlBemv/p+5xnHiokwbqSW8/sWwgOUNJylngIjl/8zQtoyX9B1Ho5Qz
	 iS2CATokin1YOrLYZvNk1LIoYxU16r4gnO+6SfBpfIudSAaoDC/CbXJ7e14R3goesodzu
	 jIRDgv0BbNfgPq+FpR/ME16WIyEmQHP111GYMjmC3o06SAKh5T/TV4wLnhNvGI1kTdp55
	 OL9PSWAfcwZZKTY+F6fnZoAR3ijc6bF4mOuAzFYTfN6EKOnHIzKM9892uQOfwKjdN3KgV
	 K61fpQUrmlnz/KpxrFNg6AzMWLGZxe4N2jwo6smZWg82iU+ponGkf/q1mFVXeL9eghQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=clyso.com;
	spf=pass smtp.mailfrom=clyso.com;
	dkim=pass header.d=clyso.com header.i=@clyso.com header.a=rsa-sha256 header.s=google header.b="MBOwL/Pe";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869CB606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 869CB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=clyso.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=clyso.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=clyso.com header.i=@clyso.com header.a=rsa-sha256 header.s=google header.b=MBOwL/Pe
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c5188e17487so137432666b.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:46:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795675568; cv=none;
        d=google.com; s=arc-20260327;
        b=BZmNO5Z6rRvOnF0uXc9QTqDIJ4d/Ll4g+bt54EyyaCQCR2TaiHaDTVvZcaaSXe0qE9
         k4FurmyPSGOIpaNJ6wqtlrM7qRN18gE/9iDglWc2Zk7u3RWyc8+CY6ksjTNkcW0woiUF
         u3zpcXk+57+/Okx0EU36rr+awWSXBjYb+KzipwtEEZ4TAGcNEiuG0jssDgNPkyyehEV7
         R+JtnDDo/WIeKQN8T0Qd3FG5z4TSDqKtazTiMYAEprMjOHRHCnPUuTzRocD+5Zl0Qg9m
         jPcFGL7UjJ+abG+vaT91h1O5fkCV1hDnZYk7mBsjFL/nrWSLKQC4AFB0Y84AWoU4B5CG
         o5cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iEdrgxs/YidBZzZOj+WIohy33aH+C5/pNi1p+tZ06Dk=;
        fh=6s9wRQ/VktFnb0sEyraOzcUXOW/+N0C9b/fk34tl5Kc=;
        b=p9VvfccDaZZopvr5HejOwl/nXC4fVB6S5v+aVD/h+qx9M8w+sTLmds677MrDZdrJM3
         CXVYGJEFIKittf1jrw6B4Ioj1SimlbeqbctDmdbuE7EMX9bVGQJy2SZAMZtbQTafx8xT
         TlYIVwCPQNh2I/r9lmO/X83iWQEzRnlAcOcrXhFFvjA79WSsvI9t1oT4BBJ4N348R7rv
         KYxLtyITa59qdCynxbtQlW5Ztf6DqMtYOw08njt0m51yGuDXFRiLlBCbXaHX8AUqmjIu
         QTC/wnyGZ3g18AiPMI+W1QDpsfrt5dbcOdT5rrzdORWqhx654aCamH/333o1RkP+LwGM
         Vd5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=clyso.com; s=google; t=1795675568; x=1796280368; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iEdrgxs/YidBZzZOj+WIohy33aH+C5/pNi1p+tZ06Dk=;
        b=MBOwL/PeCNHQ7FOu/L9RROUabJft0BnoDu395QAGcFsOvj4kjrYXJxGfwd8q20f2Gy
         B4GMY0d74+o9zd0SqXig8YVHtqG2hEqPwQeVKolPrzB1UF9omYWhowNS/Z3S98J05sGS
         weQw7NxLczGTe1kxPLNGBsPAmmohuXAmsPv6G4Cy8sZa6q6hICOeVGQL6writsH3EFOe
         4zERMOBZilDaQnmL0c0dD9QJBBbsr6EXOd0U1wc3MyxIMh1NYDxUADF0c0NmN/tdeMo+
         0mIZYfiYiGlT9VKxaukoeYHFJ0zUzoMeh4VTd2W/vNVa7ftsXMmz4AhSj6l+AxLpbXWh
         ZnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795675568; x=1796280368;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iEdrgxs/YidBZzZOj+WIohy33aH+C5/pNi1p+tZ06Dk=;
        b=Ie715aCapqcOvbjPBFcUr8YadyQUjItQtNqKPgOGKbYuDIJoExPb3tHkRt4utWCAGH
         YLPwb1qw0NGVNOe4BAwatifyVHro6gLTUoP0wSICsGUwovNZQHXoDg0WMbJTuaCgV/x6
         fCC37ELwIjBqpYUjJNg82X1xZTiPe0+PwrfNrtnz9tmutp487AaCW0V4p2MJINECzheD
         1QuUAjOjhdLnDxy18WIotXevkjUSRjIP+ra7OezZZ4wOzj+AhpQHlmVh0MZZ0YNeX5wj
         58kJa270T/vtO42x9FICzy43h7itUdv3ZeJ/ufKgIhstR2KRf0gn7gDabZ5FI5lgehQz
         O96A==
X-Forwarded-Encrypted: i=1; AL+hErEanTF7QnjKkgZc2pQDss93P49M94IC4v5EXN/yzx3VVM/7EY6MvkJnBaemvip7CmmrBuz8yQ+StDj5TDQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9t/gIhkTlshKOpL/GEQphFGtICccz4UV/bsNab7RpRINQtDvz+
	OmOWYn9I+ayW+ulG/XAiXZcDKgsPBicqIzOfb0f9L4JhZs/NAxWvStTkMC9NizERExlZUYCtMwk
	xItlaQKwSbEGdK9Jmg5zyiNq4GGToD9Z1on/hkKc/ww==
X-Gm-Gg: AZFdTZeAsQRmmd1lMOioJNyRRZcjr8Ha/6tIAvzaYaMDyybB/LFryWy5J+CXRR3KgNi
	pctGoY2dmNa0UkFDhS4j/W8GuKCLL/ps+W9zuq/R10nwVMJL82v0j9KzDVnWWAC4Rkv2wVxzZZn
	pgdkS4nbVtNwixhl5/htmCCuDmWXNSI/oY4Zy7yxTPa+nsSPSMkOC+d5HySKoyjoIf0TIlWHTlX
	fwor9OoeU9ulTB8Eu3CwEBGTnDuhtuc79lJQGTF0IaiZIs8omVPIC42UCd9CcMKH7jdjQJbS5Ur
	kJkpy96Hs8uLnLfr2SOX5JUKKy4VFFi7MHz89MUVJK2cA89/VvC/Mrfbz5C01V+dq8Fy4XXSlfR
	fxe9qm82wD6I3SspRwz8dy8BR6cz6rvXWZ2eEnTB6ymt9jg==
X-Received: by 2002:a17:906:c1d3:b0:c2a:34fe:ea4d with SMTP id
 a640c23a62f3a-c513aafb433mr1233685566b.25.1795675567751; Wed, 25 Nov 2026
 22:46:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121-ceph-append-excl-v1-0-5870375edeb8@clyso.com> <20261122182549.1297448-1-amarkuze@redhat.com>
In-Reply-To: <20261122182549.1297448-1-amarkuze@redhat.com>
From: Xiubo Li <xiubo.li@clyso.com>
Date: Thu, 26 Nov 2026 08:45:56 +0200
X-Gm-Features: Aa3M54qS842e194_v0RfNFp9kMvv1asDtn4xiKKG2lxOtvBrpkvTvksVsDe3Yko
Message-ID: <CAOJNxRKotmAGPhYjM8APGZq7Qzp=iSpoO_gM1qBnS1u9GEawDw@mail.gmail.com>
Subject: Re: [PATCH 0/2] ceph: serialize O_APPEND writes across clients
To: Alex Markuze <amarkuze@redhat.com>
Cc: Ilya Dryomov <idryomov@gmail.com>, Viacheslav Dubeyko <slava@dubeyko.com>, ceph-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "Anthony D'Atri" <anthony.datri@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Alex,

Good catch, thanks.  I reproduced it with two active MDSs, one of them
hiding CEPHFS_FEATURE_APPEND_EXCL: once the directory was exported to
it, the waiting append never got Fx and the writers hung.

In v2 the waiter rechecks the auth session on every wakeup: if the
auth cap is on an open session that does not have APPEND_EXCL,
try_get_cap_refs() fails with -EOPNOTSUPP and ceph_write_iter()
retries with the existing Fw-only path, and ceph_append_kick() stops
asking that MDS for a turn.  With that the writes go on after the
export, with the same behaviour as with an older MDS.

Thanks,
Xiubo

On Sun, 22 Nov 2026 at 19:25, Alex Markuze <amarkuze@redhat.com> wrote:
>
> Hi Xiubo,
>
> The feature check happens once before ceph_get_append_caps(). If an
> append starts waiting on an MDS that supports APPEND_EXCL and the auth
> cap migrates to an MDS without that feature, ceph_append_kick() keeps
> asking for Fx. With another writer active, the older MDS can stay in MIX
> and grant Fw without Fx, so the append keeps waiting while holding
> i_rwsem.
>
> Could the waiter recheck the current auth session's features and fall
> back to the existing Fw-only path once an open session is known not to
> support APPEND_EXCL? That would preserve the existing older-MDS behavior
> instead of leaving the write waiting after migration.
>
> Thanks,
> Alex
>
