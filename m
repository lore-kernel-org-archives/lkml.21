Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655917;
	b=ywU4Lh31FIb6ULdrQ0i+MdVZdAsQHkOAypCB/3IOXkFpSEuHl15Jl0Uvy/YteM/B8C+3
	 ky2HznVSBAmXCQbPbQ8jjA+DGG5mCbYVtdet2WmFg/a00ydPZu7i/EzHlxOcL/3F1f3KG
	 +kHQxc9xudl8alIjOy1/CudfX/fov9mVfoUyMIm1zPVC0+kzgHlBJkTFtMMyUd1ZdH53R
	 0AjFH16wHhumJf8DmO8GoOQqZEZm4SNW0/y520Y1ELhkwOAOoH+XtpDlt0YD1uyCXcCbW
	 aWgDwBxdbHeBNlECv/2pYUSUTGZCEpA0+wjA8R1+IUNCl55rgrN2nc8sbi/Znhf2vYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655917;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=tCpZfL1wX/OPKSEjb/AJZnJQXx6AviZQjd9JGVl9xAU=;
	b=4eEg5Kc0sxnPG/4jXTjWPVIA1zxBgVTH0CDFaoY+EEil+0MwbLhJTzR62dWgK0u4Xqrz
	 GOLMMrsHqOI9T0koB6kAAdGUN8QVes3WI+ZsdiQUCXtfSZdTPHd3dD02JNtZ6pDK+2YmT
	 ZWQMt4Dak8fSwL74Epo2oK5odGkGKmMiTC+XJxWUDfOkxftIyPm7NqbwvWhBVFH0Mewc6
	 vvPHy0xAjEzEGf7XpvUq5zgDU07T36Hb/EhAC2J5J2KGyQLiB1LogRzp7IftC1Oy0xUE+
	 JkJJRX9Fz4pblCPRveu4BLhcMZ0eKuB3WRzYlTmsyocfExVSQEGygAHoHpEthw1e2ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="pJ/mYBYS";
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF47606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCF47606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pJ/mYBYS
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-386c71feeeaso2822499eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795655916; x=1796260716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tCpZfL1wX/OPKSEjb/AJZnJQXx6AviZQjd9JGVl9xAU=;
        b=pJ/mYBYSMKnF6iJbRuZIYaVgwBrcf+KBaKR8aavQYOpIBC0Y0hfxo1SVsf/YOpTOB4
         05XuN4IbMIXYQUKyU7pekl9cFgOSs8xittuFWVU48/audOI4sm4h6cS+IgKUFGf9LU9L
         s9hWLX6LdR4EWa0Hg4yhjPoHjHar9SGKyfSi8/wItl3Q7MG9yiwJheQ2vOevBTgVy3Qf
         /X/kQcHqJ5Ca4gcHdI6EqKNWEjqbI/meFUzvrcvGgdKm0ALB6jnUmb0BpwBew+CeLifE
         ZGmzMUYejdzXgvmLSXCDcSTDAX1yoEg0AvOW7lYxiu7OE0orBe3a8/MS1/Re5+351ADr
         Su9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795655916; x=1796260716;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tCpZfL1wX/OPKSEjb/AJZnJQXx6AviZQjd9JGVl9xAU=;
        b=slBjuLKYzJdMpFuGBZgZfcpx/sn2XR1L/DgsgBDLn0uZ/69l+uFAEbqfemPyW1Sh8d
         Qq7twRJ6K2fjN4pudvRSAEV0dTlG4zz6TQelj5U0xJsW8WV6yt6IPawh0UKsMd+eh62b
         0TecIO0FLSRw7A8A5dXdJFRPCc58Q0GVw5dSTagbAS4sFtM1VA4cD0HDzqYjM3Q/Dwqn
         8W4uj1wN0rwG0vBGK76gdZLAPyoLPydrCVC3nuQf1tYLKeHS/EkUjjnZDvnyVEI0coDU
         6yrJtkLJVoU8k2wPBUae/0sISCc/SpZLPR6Ied8/P8mg7k8WwioSFbgk9RCw3Cs3hN94
         6ANA==
X-Forwarded-Encrypted: i=1; AL+hErEW1AgsQvbWPJeec9gd5+G2Vqh5lL6SCbTr0uNjSQM7QJ6WUZvZNFKOQV8VZ8n3LQYXaiqnuD+QctRHJSg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ca2LjPhLKZd7o00fT3UHrPJlXNGXO9nG8/SGUUmy1WCpnVu+R
	59OCOXyP4MkUGqYoHx0dhkMIZk5fKG6esoOdon5RzQKRBC4pcAWdPj2TR1+hlmBG
X-Gm-Gg: AZFdTZdpoKaN7w7ItJ3kocvEIoMHzXOfQAnn/iRemAery2rMLd+uKvrdDx0R6mJeImO
	QCGEUPu8fPT7aVCznLRqwdgZsdnQ2AjiICPmr5Wcu66CWzDsav2eg6qPfGl9scITy5OXYUYsxGI
	wEAoWsKHlrrWjjboaAOd0CvAK80OO4eXyWfdGOl5HLF4KGeY+tems/PZ1KhJf34DpNMoHpu6cYq
	2fUD1xAGeOt6yuMNa+7Z3tPy+/FNA7z4+UDEpwPmlxVqPtWGHg7yClepPdBEWPjvPaai8D2hj5r
	CdG3qYia89DaKzEepWT/3wQhrguWQwYFE25hh/u32sf22f7ZhoHCVizI7vpMk7BYI7l0fZnmGUr
	9tPBLl3+RPmf98KtK01T+mFMgmreXcvOILe3so1CNXLvHFchLX61n1uMB85v3YPOFWA0+eWTeD4
	5ejHu1fMvdhvXyf6g7ODRSnoUSLaOIacf/gTww4DXvxvWs0qVdEdiVHUvqa7eIQ3cG28pp4vH/S
	9B5O5fYCUtgkY2kr0yM9A+EHwXu6fifGstKeWxTrxrOeT05I+9qb4gAmpsxQ5RXxhb/bEIG14KE
	LJL8+53QfcrAmLHITH2mr5ZnmQ==
X-Received: by 2002:a05:7301:dd8b:b0:372:32a1:b384 with SMTP id 5a478bee46e88-38571510675mr21858154eec.33.1795655915771;
        Wed, 25 Nov 2026 17:18:35 -0800 (PST)
Received: from [127.0.1.1] ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm59493573eec.28.2026.11.25.17.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 17:18:35 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Joe Damato <joe@dama.to>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, TAKANO Mitsuhiro <takano32@gmail.com>
Subject: Re: [PATCH] net: page_pool: Drop fast and slow from the params kernel-doc
Date: Thu, 26 Nov 2026 01:18:33 +0000
Message-ID: <179565591347.2620653.10113500685531469666@gmail.com>
In-Reply-To: <awdsddjX8STuJ4WR@devvm20253.cco0.facebook.com>
References: <20261125184640.2407270-1-takano32@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: kpatch-send.py

Hi Joe,

yes, that series is the right fix and mine is the wrong one.  The warning
comes from struct_group_tagged() dropping the member names during the
transformation, which is exactly what Omokefe's patch repairs by keeping
the tag, so @fast and @slow become valid tags again and the paragraphs I
proposed to delete are the right documentation for the members.

Please drop mine; I will wait for that series and will not resend unless
it stalls.

