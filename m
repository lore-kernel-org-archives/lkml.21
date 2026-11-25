Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795626929;
	b=l4rIIVwPVK4owAVsPjuFHHtFuJMjIXbBD+NWm703QIHIOIQxE5XsXOqp05JMT6mUESJo
	 OtmLgRN/2Tye+C/OUcSCLxx6pg5X3EPKhhwR7OaWU7uoEUeogj3g0kIeP7bQ6YXw8LhiC
	 Ib+H5XNsJGQxZQX8DE2elL+L/KFPIgELo5mWUj1VE/Z0itGkeVbRamWAFY1UTqr15cbLE
	 c876i317GDeMMGvilEL8yq8dC+66Mlx3Bw+pcrRmVYN2qWi+2XNz6aqdWqZI9jvW3WrXo
	 GF/Vc92m67mpHCyl2GMt8uYWebt7Csks6dKc2DqeBLGsvt8jUFNCNkOMAo7aY8Y3LBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1JuUAgtC1w7YNld30axOMbqPcsfv9q8Ls8BXQz5mjVE=;
	b=PKgb/KCOYrUXbtY7D45pZldbCBqkza9yyUQC61KQfOq/Z5/vuXCWU9y67emk9ItwbLY/
	 oZDivKkSVpp0dC1YQ8/A2oUZs4NCLOmqCCrUJIfcC/RK4ZHuMuatB9ghIlO7aschbyO2U
	 OPLRsTVuTlo8QkqcdFCnA1Zj5RmRg3TFYODeFOgr5ThT1s+whNWTKpN4ac69tl9hOmFNd
	 R6xIX/4yf9jFe3VdGX5dxHJa9Ubx6ButNN8td3cIme11QCBdT/SvMmavJhdUse4r1fWtN
	 hnagjXHLNA0YqunHWslmPSNYzeHy2l4nwqNr8sjgSz6JnWb6sdrvkusbanT1aiPHzVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kC0yGBzj;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645C6606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 645C6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kC0yGBzj
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f041f88577so33829685ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795626928; x=1796231728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1JuUAgtC1w7YNld30axOMbqPcsfv9q8Ls8BXQz5mjVE=;
        b=kC0yGBzjd4q/7GZNKgl7OBhJPcCAFdXDZ9fP/IN5rPvjLXc2dMlqY4maeg/gSVUJbN
         y4YAWeVeEncq4Ne5s3OT4RxSozaw64uMBmVwSJ8f0+4S/ewarY9gbgg/4xIAVNh7XWKA
         Z/lfo6wALIarGCl27TGRyXzMipIkV776r/88tr2FXkqUrIKykSeJ9Z0XIOrcU7XwzJde
         QmDbSGCaqIARvOUjC/PN0WUjrspzmB+8CLadOdu+zu0nV9Yq78nJ0c+PjI3FxB6Sty06
         D64b1mMkI+FWLdgzlQ0vyzaaQKEAXfzX3ISH09CAg7i2D6FBYnxf6Y5J3EJYwK6CwUwd
         86Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795626928; x=1796231728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1JuUAgtC1w7YNld30axOMbqPcsfv9q8Ls8BXQz5mjVE=;
        b=pckeNuKyUAeN8yBEcE5SBdcYJEA4Py3D6KSEGZJtHpZkevhGXlv52R4OwxbOyrNNlX
         yrGqUKCk8pCbBDcjuLSSmVBnk7fGjOuJPPd9cn1K7BubUj27M/l2UgmJOtUMKwiA/Tbv
         KpBGl2emgF8VwwKKrbmfQYpvBbjhJ6fUoSlNo7hZ41Q3UNgvtjMUyGCY18YJS57YIyPP
         FR2vkvSnVj9kV2dSsTWLS/kYxyf+YVJ/1vBjC+EQMxQu7btap6n9CJT26Q0ijad1sCo+
         bDBZ0+tT42IYjwb26mW9M/wQBxBQ0Yz7dxcs8q5EBWAvoPttwanQBYQcohw5vrIRx6MW
         UcOQ==
X-Forwarded-Encrypted: i=1; AL+hErG6UJZ+3ijMmMaDd1IDZ2LhW6RGuTPyuQ3BNI50Sjoxjo8ioaK4b5OfhZigmDlK6EDFfvDu+KTURTpusN8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OE1VTI6X3/bN3FAVZcaI/KFsAdgFu78o1AhUUhNTELdcLPnj3
	3ZJieGRlhSaiNdtYOcgD81VHxSnpNvmCQvRGtCzP/gfXngO4Qi0hR0aA
X-Gm-Gg: AZFdTZfhPemAkypMG/gXrQAhTQHAIaktGFebY7iKXVAQ77usBDbdRwkw+d4beaDmI1U
	oex4nuWuRCYWmTSo9hdVW70BEgULXO0x8L3Pi9BbmQwQmCi2rFbnf0oT0x8RlyoWHuN0UcLdcIM
	80cptx5/l0iae0QH5qyKd/OqdaT84b1uaXCE6xnkQWrsiemsGQmGtnnbnPTsJAUVUkhqmHRVNPs
	Eeh6bgQTDOq9or/Z6riev6EnUgok0OUOa+iy1jzQg7SrBmIFfUkAsqI2mAFIsSsAx0SAdb288u6
	PQeVqN9YskV2AzYPzpsrErSINjUMSWNs6Uw+gXyKa80IhmfCpQ/REazTs0cuu4t5p1sr8wmTttd
	ciXr5VVJ6jPSf8wj1PxlJkvQapMI4nPj3z8FwaxHY2KJ/pfVkbnm6imXT4uNhc+nRXthOJYMVMO
	D8jGXnm7ULztBbdrawm4iuuiklq1RDcWCRYHHveSYLnpBasWN4Kw515rtg/vGQrtUvFeCgNkMQY
	hWRX0LeeHXVI1opIGEgEVrsTU9BvuX8KMQZUZK8T8r8zYqj+hQHm553Rzoo+KAHEGt3kIDG6uI9
	28/Q+s0fpkr9uocNBrWNQB+GP+dxvH01ynBGwd+XoLVSUc/f2uw2tCE3uj79ug==
X-Received: by 2002:a17:903:19cb:b0:2f0:3b78:29fa with SMTP id d9443c01a7336-2f03f1df637mr195381985ad.50.1795626927701;
        Wed, 25 Nov 2026 09:15:27 -0800 (PST)
Received: from localhost.localdomain ([64.118.140.61])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84285sm88133495ad.3.2026.11.25.09.15.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 09:15:27 -0800 (PST)
From: Ding Feng <dingf3ng@gmail.com>
To: Kyuwon Cho <kyuwoncho18@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Ian Kent <raven@themaw.net>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] statmount: retry an overflowed string before reporting -EOVERFLOW
Date: Thu, 26 Nov 2026 01:14:09 +0800
Message-ID: <20261125171515.16640-1-dingf3ng@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <179552693473.1490262.10477620788152048784@gmail.com>
References: <20261120033644.99834-1-dingf3ng@gmail.com> <179552693473.1490262.10477620788152048784@gmail.com>
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

Hi Kyuwon,

Thanks, confirmed. On v7.4-rc3 (arm64, QEMU), a tmpfs mounted on a
12278-byte path loses STATMOUNT_SB_SOURCE with and without v1, and gets
it back with the check moved up. 12276, 12277, 12279 and 12280 bytes
work on all three kernels.

The early return came in with 75ead69a7173 ("fs: don't let statmount
return empty strings"), so v2 has a second Fixes tag, along with your
Reported-by and Suggested-by:

https://lore.kernel.org/all/20261125-statmount-retry-v2-1-dingf3ng@gmail.com/

Thanks,
Ding Feng
