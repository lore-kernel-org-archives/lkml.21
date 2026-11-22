Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795372992;
	b=mNWRKkKNlqHdS+UStil4FxF/dhHOyzc7d4k8Vf2wUU2yAagg6dWgHoxZNuwA3uX13YlO
	 DHhr6XdV0vjAHRryJ7/LTBo+pBTV7l0w/bIH8dJt70tT2umJ4kFO8ffsxjvClO7dgOEJn
	 +GeWtmYN019yQgXHEFLR99DTpFP5HnWcDfBUDAs6YuZvsoKuyWlngmnMLYte9RXrfdK2u
	 A3UQFAV8uZQPd5jW7N0pLCzxcrqVs3uc1mlMrg3mOPFCv8w82HXUmg2Mp3gdqJfUuJ65E
	 AdDDk/k5M3Djws3t/i147G3L5GrVMK0VfAmrQnWgSMCTWWDm8JsYqJ0Vw3dMOWBSLvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795372992;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=cBcRUPE1iZgUTO5vL9PNhYI1VQ/6dT8/jQCn5srupcA=;
	b=KXfYzCKjXxKXZ9cRtXtYWFXgLaXkP8XibhmJelbuEpW25+bg3rsLHHS5q8iXogvJCTkh
	 x+Lf1TGrMpyPZpSgpQRaFrSnk3qN/DG2xMMvTo/AdNx6w2rIwwtWEsjvKF1Z5EY+SoyZ0
	 yzdE9rwjYnl8vJNZMHj0qEhUDA1XH1nvVGtOarV/EBQeAaJR1JYP6BehcIQGkQ+HgyMjF
	 LcwWIJ95cgZ0JBD/XmR0I5Bw2nI2eFLx4EZPRr3dzzvsXuFTWNSh+XhktyvCB3QGxBdSB
	 ZRA91oNnn9HqK4pGM0+/OQzd+UgYwxWxKXoQEMMiraskZ5cblji0HfWLWhSeeIp5vpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="GUvz1/hg";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kA5FPwu7;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375F2606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 375F2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GUvz1/hg;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kA5FPwu7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795372990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cBcRUPE1iZgUTO5vL9PNhYI1VQ/6dT8/jQCn5srupcA=;
	b=GUvz1/hgDWYKSfG7DpRvmwkOrncNOKpEKTrcr6r5w0UWrA51mC9rsOvqfGBhsskFBO/RQ7
	OA+KTVsHgJ2+hJQXc7YuglHGzORrRCI7zFQS6Z8NLo6oVHSvDxjKaUKMeFB2RPXSJH0tRv
	dOXid9y10TdKtOzSReJ2TRrvJfiNmjQ=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-9Zt8P81MOWSOqjYCKR21hQ-1; Sun, 22 Nov 2026 18:43:08 +0000
X-MC-Unique: 9Zt8P81MOWSOqjYCKR21hQ-1
X-Mimecast-MFC-AGG-ID: 9Zt8P81MOWSOqjYCKR21hQ_1795372988
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-55bc8181defso50103631cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795372988; x=1795977788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cBcRUPE1iZgUTO5vL9PNhYI1VQ/6dT8/jQCn5srupcA=;
        b=kA5FPwu7R6lZ/mBGiPplBrZNrp83YZBkHLHEEtso6d7pPoUds5cD/6OjIJbgIfoZv2
         SjoT18htPH8yAW+aOUs8G+mK9LeYdRFQ/Rzqv71davcXAYdhvr9uYNn92czEqfHGpuOg
         FQcX1bp1YG+rM/X/0/+xYq0FX3cs1ZBO2EvuEDbJLUuKkYGmgGJXUtSWIOq2MV4D39VG
         5Lf/bhYCL2ojZjPWcdjTqEiUANxzQzWcbuvTUcZWz7eXUHnMvRk9Ra+4f3IjFXcoOmX9
         0pqV1SY9fQKI1wCfX34e3xB6a7noQPlz2OGGH+4c1jpKXjEoZTtS8lU4Gzj2CJDZQ7JX
         ipLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795372988; x=1795977788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cBcRUPE1iZgUTO5vL9PNhYI1VQ/6dT8/jQCn5srupcA=;
        b=2gEOEANJUWK+7l6UmhL4lUOXXZdnw1vGwl3oxoj2WvKEXaCcW9xYkXgteMYGIe4hR1
         yGph4TywhXgICU3WnAZbJP4FGRDR4eOF8JkSbZEvlay18FKxVtskpPVP01JY9foXoC6I
         iI7dPQ0CAC6OphJVtSVoowuE6YWEfGk7VW1hQuCgtIE973sHKIHfY0HV0Id42lVHXAvB
         QndOwl0uTHJEmcKZ084nlkaFvLco7XE7ik8sod3diLhGrbxaIWtUpkSPWWd42ZlW18co
         jEDzHoyAIFDovwvWoYSkRNPy0tAtSdQfOELbIGEZhIJ3F8cjSyrjR/SBEVt4Z14prEOZ
         auhA==
X-Forwarded-Encrypted: i=1; AL+hErEUGuTzduQbf6jOnshUKMGDwJjX0EyDTB9151dcGyh1ycL2uixADbKZRHZ/R+bNFsY3ycI0BSel0XDeDxs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SZ7AU0/sGIHSSY2kagxSAWdcm2YNMMNvGWVUPXiGBZWOqeRE4
	Uh3AapzTpmJrw2prTW74Ohg+XPvH9zIA5K9vod6j7js5ZgWHHsm5VtbV4GVaqqTytE90DLf5Y0M
	ttLcCie2bevSqevGY9vSLqf1znIZYIefRyQVi2whCESTNQPZDHyEyvX61pQa8kmfIRQ==
X-Gm-Gg: AZFdTZcvNPNBeaDMA02LNjt9JD1FXt1ZsmTGpGn/3XSKhsQM8BajfRDPwDyqafukw6Z
	fpuw3CuqKbirSEhPWUFv8vmUn02xTG8C2y46A+N2Dwt6mNv4RxRSaz07ZZ+dWv8mTBXp+CkUcNq
	ywafC2K3VYDk+XOI1E5H/VyGSPA318VbkEXqMi8kAQNljJNumHM9Q3h9frvm/X/4kU3Rj0BDYKO
	mZJBbEmSU4qNWxKLlGvXb3ZjxEk4vfH97H/0JDslGDQGPaDoP/Y/7Zq+XB/+4TeGbXGR8zm23ik
	Wk1jrK5f76JDV6ZasFn87jK6hCKwciYc84XP+CLBCNYM6ESZGxE74y3+a9bWChasxEcq+kjfRBx
	xMiZuz2jzlyXpEVreuyIzvIzNAzVMTvr3a0pLSbAS75gXThyXTSv3bo89Xxtiao7UxY+27T0zWE
	bJpFLncYSZpuwHUfuJZ51h9I/5oIWzH9Hp8olAVoXVRiZKKFJPvsr9X58fLqRpBYUIGUMyGgt/r
	p3l9/0j3B20+5P/JGx50VhwiI40ExIKc4Mv6omO1XZiNCew2qEB
X-Received: by 2002:a05:622a:580b:b0:537:a19c:aaad with SMTP id d75a77b69052e-55d76adb4f5mr145678211cf.65.1795372987757;
        Sun, 22 Nov 2026 10:43:07 -0800 (PST)
X-Received: by 2002:a05:622a:580b:b0:537:a19c:aaad with SMTP id d75a77b69052e-55d76adb4f5mr145678041cf.65.1795372987327;
        Sun, 22 Nov 2026 10:43:07 -0800 (PST)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7882c64fsm79845241cf.10.2026.11.22.10.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:43:07 -0800 (PST)
From: Alex Markuze <amarkuze@redhat.com>
To: Xiubo Li <xiubo.li@clyso.com>
Cc: Ilya Dryomov <idryomov@gmail.com>,
	Viacheslav Dubeyko <slava@dubeyko.com>,
	ceph-devel@vger.kernel.org,
	stable@vger.kernel.org,
	security@kernel.org,
	Quinn Grant <leograntquinn@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ceph: ignore a cap IMPORT peer that names the importing MDS
Date: Sun, 22 Nov 2026 18:43:04 +0000
Message-Id: <20261122184304.1303832-1-amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261121-b4-ceph-cap-import-self-peer-v1-1-9cbc14a6c8b7@clyso.com>
References: <20261121-b4-ceph-cap-import-self-peer-v1-1-9cbc14a6c8b7@clyso.com>
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

Hi Xiubo,

Thanks for the fix.

Reviewed-by: Alex Markuze <amarkuze@redhat.com>

Alex

