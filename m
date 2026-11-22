Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795319578;
	b=Mg3lYQqAsx9kfdACRn1BDJbLZVvoeiop/uF9ghHanCvKKjd0tYde9Vk0XgoYbNZtsMEf
	 LDXLkPOesfDGH+fn1AMy+hoone2p1VD5caSVaGs7UOyxN+yEGIbMQL/xJRdHRnVghqb8L
	 lUdtzFjFgz8UcLDOGrePR7DFIwnG0pHzYSZGLxiJ7YoQr9AVh/fjF1/XU1mKV7q6iKRgx
	 dKaiNuAjQ98FXzpVkyD5sgreMm7iRsmmuM+IkvWq7Ry+EiwIdYY7UfqVPjXIL5Bn2cjHA
	 vt6ca/u1O+cfrK1tQEH8JBQ1I9TwhtziqYUTiCwBVhM01oTAPntzl/XzC6kKQ2HP9Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795319578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:In-Reply-To:Date:Message-ID:References;
	bh=3/acJDvQZeUDuSHYPSXBbXR1HyKyAQ1dnjG4woxCX1E=;
	b=Y1ChqovXTZRdZBwmqSlqLxa+9gHCi7FcZU7CtMzfNBnxX5A5SlqkkIF6cOD7GKn8btJp
	 PQOAYeWHrik+Gvf5j+YAeQ9qejV6iTT0NuD+DQCNn5qEabJjwqVRSfaxfpG9XaLHTHINb
	 v6p5yXRieChYxy+orDO+YzgML13vxd2TtCGdb5I9CCTJoJo6Gu/tcS8fMT6odHNmOeaNr
	 5d3AKsVa3tZxHs6XgWqfkqHPl87zZjCof7Xdk974uVki771U1IW0d/g1Op7Km+h5GUr/z
	 RxDGRjNe8de/Pzi4gowSFdLlD/d9C9UOWv07kyTwGAAEo9V2eOI8iTbPFOGBvWxXYvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KO2CK3Uy;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436E7606A339
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 03:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 436E7606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KO2CK3Uy
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-38190551625so4507593eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 19:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795319577; x=1795924377; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:to:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3/acJDvQZeUDuSHYPSXBbXR1HyKyAQ1dnjG4woxCX1E=;
        b=KO2CK3UyhXKE9D8xAFZWzqSwNZ1K/eoQn5DSm2PlhJKM088S3y58HlUXE4CbPZAdtn
         y7bfEsI1UIgnWN+HmIx+Fw7w62DQk2njd5LCl0EJdhsAYx896chKGa0F+2QaHGnqqPVe
         aapCRybowlt02Vytgvofs+1mkSU6VKfFglgZY1a3chaiNkr2D1WJBcQpVhkWdhxlrbzd
         vcctgjM1ySlRoQgc5V4VRv/fio6ELy3CNfwnM6X0wnjs09XPp1mRxkruc1+dqUPWDV2f
         TgeWB7Lmeo9HKd3tb8O39SavkUEtS02Hnt8ZhljvSy4u9rFYd8aPUmpkTTqu8wWzu/aH
         x7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795319577; x=1795924377;
        h=references:message-id:date:in-reply-to:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3/acJDvQZeUDuSHYPSXBbXR1HyKyAQ1dnjG4woxCX1E=;
        b=PYFMEPWnAYnvqKU/oZ2lMhA2yzyMoAbkzELyn9AdkezMq8B18sA4aRX9+aFXeQLmTF
         OfkEhhP6tHdU4+xQIImPOek0jEG8pJAjqzubVE1eABNXmX7zmeX6h5GIusljmN3n8g6q
         E4GP4P9RWL97KJHrHU+skhZz5r0GqRPohhlVYejTMwlT5IOK0ACXI8yLB/RojorRt4qL
         w3sP8c8gSn7FDCwtEuPECOFndXoZ56xXG4JgFQPORXeU64Eshztl9+i0QUd9MZJfwaxq
         Bzu7e3aYljF3T9NRToI/nV/xO6If2xMSwibBEu8IXBq2VTrFj7tTSzw5WXiN7SZP0z0D
         hRvQ==
X-Forwarded-Encrypted: i=1; AL+hErET9mVIq2JEPmyD5f8baK4kROSaeZmy/NL8Cj87w+0w0mgidPdcjcDGyRjcqAL+xFFMf2xJ5apz/G2mKOg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8B8Q7Aeix/VAVa56qONoi4CiZesPfUtU89ZtIQCbxCURIW68ME
	9ironxP/cD6f8Xsgtu+Jjm+KszlSKP7SlYP1DMnl7a+dFaShKARGAN7V
X-Gm-Gg: AZFdTZdx9LItecTRyNidsxtk2I0MS5tzrfoK4YwHIZ7hBgqeh+8VFQJasOJpLRtB0sk
	xlC6WLHeSderE5Oj9kgFePwfL8AImyxnn/a/ZjNcFfE0Yn8vkprYEKtzfXEduKXF025HiytJE9T
	4j5o6IN7k8pRF3UtNdnn+oLg/SzVpMLUZSwTHnuKy8kaa8T+OvmAx/7aIENkmXXPCjTuQ8xRIou
	IT/BdP7m5zcjSE58Gy8x2Ojmd8kXQN13u06Lvtg0c70eUU9RVOGZQLqe15ctDh44zmhOsyeHwjz
	/IZKYNQ9l4NsQ1z3ysbAwEmMi1pW82QOIUwOvFzI58APlBJUtf1XcevTl9EKCAEPaEvnFt++EFo
	FaYtn2orpt1LI4OqWxvrENQ+FCGGm42iGRLCa3EZ9VBEne6lA9ErqaVF/FeJSyhKkFZ7Ia0r+7o
	j7u/M7S2kK6tEArMURn01Gs+Dixd170Rp/yu1HcVFa2r3NcmY/ILqExrEiA0H0pipOnzDSitu48
	//OOvdrrQrX/QLPM9w5pEmGhFhR2CXETAzGqyDkWMp84CgQmD3py/RzzcRD9W8kHQLx9xOVLRZH
	WNqXw4U7DcYNrcIfgnUXRNUpPrKi4oLYaEiXfh4YyPWEgf/+
X-Received: by 2002:a05:7300:e9ce:10b0:385:2564:c509 with SMTP id 5a478bee46e88-385700541a6mr9198641eec.24.1795319577262;
        Sat, 21 Nov 2026 19:52:57 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm22045349eec.23.2026.11.21.19.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 19:52:56 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] KVM: PPC: remove unnecessary #ifdef
In-Reply-To: <20261120133413.475489-1-pbonzini@redhat.com>
Date: Sun, 22 Nov 2026 09:13:29 +0530
Message-ID: <tsl9jztq.ritesh.list@gmail.com>
References: <20261120133413.475489-1-pbonzini@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list


++ linuxppc-dev 

Paolo Bonzini <pbonzini@redhat.com> writes:

> booke.o is only built as part of kvm-e500-objs (which is conditional
> on $(CONFIG_KVM_E500V2)) or kvm-e500mc-objs (likewise conditional
> on $(CONFIG_KVM_E500MC)).  Thus, the #ifdef in kvmppc_core_check_requests
> is always true.  Remove it.
>

That is correct. Looks like after KVM_440 removal via the following
commit, the above is always true.

commit b2677b8dd8de0dc1496ede4da09b9dfd59f15cea
Author: Alexander Graf <agraf@suse.de>
Date:   Fri Jul 25 10:38:59 2014 +0200

    KVM: PPC: Remove 440 support
 

Thanks for spotting it. LGTM. Feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

