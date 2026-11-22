Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795375162;
	b=zSSJomEGGixz7r2Fbh32s1h4GoJADUwAQIQppsdfm0xFhCAUhEhBanGYt8DrIK8yFiB0
	 s48hpES9CtikNJbxb4nQW+suTiMxML89QJlzWONkR8wr6XFVuw+V0HEm57u/3fII6CJms
	 UFeoYBae67l1T6i02s7nVxPyj+Bf802WQ83k5ZhVKGjNlBBo3GoEvrI1N1lWXqC8QQrzx
	 ikMAzRIvpLcrKzo4gN1oCDzG7fUsi4kEb0nIMNHtu8oJHNYYpY0DHcx+699CpoxS6yfpd
	 F/HXlT7XUk439IF4ZNDtX4FjtNnHN8EF7rgCVw/VzMBojGCaLeX/lm2ohLdKnoqauvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795375162;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JgVB/O5hBKCdOeqZ2JLGG3q/f4KIK1fx085LNchkx34=;
	b=S9RzBD8NjP7xinCPCjbdEOWEIXX8elRzjeLAyvTyMxNekVfM+FM68ZbbvM4JNDt492dx
	 M6rmYp4l9RDeipOWQbMSHYma5n4Hx5ts8XmOSF36s0ykGwSpY2sPZfe7HOlGYMRMLX64K
	 E/v68sb4c8+1fv4Cul6BEnyHqxkKrj/xmBOltmoAjz7o5ps+z9licq32qH4Frb8HuELRd
	 ToAdxyw7F80E68gjPAKQQ5HJMUe0uyGbpx09MQn9MMndWQGMlBlNRe6Wg2Dne/WAsKfcq
	 o9E58G78AP8zf/Ysmk7EZXxukb13WdP7Rm0dGQE/FJeDbZWfStC/xApy4yjTsibdsSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U6dSI3LA;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AC5606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60AC5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U6dSI3LA
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so31361675e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795375160; x=1795979960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JgVB/O5hBKCdOeqZ2JLGG3q/f4KIK1fx085LNchkx34=;
        b=U6dSI3LAe1VrIYxBtdeXBr+mcGP4NRfxblw/6vXiYnN/hUemD+dcYCiyg4bNuRa7Fc
         PDwZ+RAy6HDwdH38XPhpIuauHU4m9/cBQGAJp0M9lxLx5Zqlssd+OGlQ2IMKtEDYLJCp
         Pwzi1BJffZMEU2tbHRY/eDAW/aJmWrUEqrJaipHLzdRtcoGWFieYvDL6hWqR8w3W0WoG
         +JhGcDs0po7rES+U5o4htIhLKEGZGca+4iPm1NpNTrjk1wnWIXEfqMQugIr4tUs31hSB
         ZHA3ckOWe1qPgo1hIETJIS0bSY4TNEtx4lKiipEjEtj8uarOyuCXIe4lTBMn2cinS4Re
         bvrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795375160; x=1795979960;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JgVB/O5hBKCdOeqZ2JLGG3q/f4KIK1fx085LNchkx34=;
        b=jqxTYIH/o4eQZ0lZfDLVw8WdizoAb1L0wTpwI3R4aCmVT28HbwXYcqBNesqsY1NX7h
         dOg1o5vGI+aH0OvZVtp5+cM6oIPa+mKGfr72Bb6VjHTUzuUzTgKgiUgKE/mx5CHrVUsW
         VawHm/4x19n5UDVkdyJdjCagAs6QV6irQ6z6+QSXOYhms1rT8QHGvPdmhn956lUNdDuY
         n8BnneuY+ANTSj52jppd/PJsyMXfR+8PEGjt7DiRxsL/H5Y8py3z4VF4YWwcl85wK6VJ
         cn3N2e4wvf5m8eudvBVOwqrMN+xRHqygQe1PxvzUIFuUmsKsvTovnch6yTfRziKafit5
         hAkA==
X-Forwarded-Encrypted: i=1; AL+hErFjhFKglKXxSKtr9kP3bpqzHpAbYKEgNroRgCShZowC0FU9BSmIy2kejo54VIiv1IO2JP26KbbGu6x8EPI=@vger.kernel.org
X-Gm-Message-State: APuU4Z838+Kezw73bETLQCYXFwUQ4OULxDVoaqMTG+bl1HyQuilFn12Q
	tM6v1d+nMW/slSx6bS1y461dCoTwtEGeUOUpKrRgthBnyaKdlBaxoOne
X-Gm-Gg: AZFdTZdduwBaX1pc6HeJaWzWCxCDhlr4iI0Nie95n+bNAlSI0b+y3Ez17xMV3QBQSie
	ukPTMyJEpqBPPBQ8UOGBpm0RGp7e68cuyJbjDerOz8gcvzUWCevADInNkQADHLmtK2WFjMHQ6V7
	rXIbff4oGhIsF429uHHhrwpk3yO8Miv9pmE/NyzWMH3xcAXoovjdZewlijl8I/PtyEaYtMOHDB/
	OJnzUCSUX63YpeqmuaGb4Aj8YdYxFQYKpYM2BhcuGBp0Sx5ZUejp6bFknmWZhluVuvMD3/B+oel
	7txeaEazRsbAhIvNNmaZNBQhtbMkgiQxmwUYVBGiG0FA4vdBCavwOI5uvs100k95T8ePW9ogtEN
	x7uTKzMvglUp92SkowPLhTPZud6Eda8rytdXFwFHQkKv0ygGJPBp9WFWD2IoFRqso1jgCW+61x8
	vgWDkDtfWRLNTHwMNXHsSntbUfZvYzUrWVYu7+YU0AosTkapLxZIYfi1n9DD3xOy8sIC/orOnhP
	sFpe9+9S0mpWvqJB9dj7wYKQLQ8baohiuOSBLNgR6MMm1qwEu74+haaLZJdE04NJexMi1mIfeST
	+nbFTHIHv4GJ5yQ0L+ooHTJ48DOyQCtN+wZeAktXDbcH2/xn4RsJwg9PA80rFBsDOQ==
X-Received: by 2002:a05:600c:6749:b0:4bb:5f95:c014 with SMTP id 5b1f17b1804b1-4bb8880f283mr208928685e9.19.1795375159763;
        Sun, 22 Nov 2026 11:19:19 -0800 (PST)
Received: from cachyos-x8664.aetlocal ([2001:bb6:e78e:9100:cdb3:c7ee:74a4:5189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm389657845e9.13.2026.11.22.11.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:19:19 -0800 (PST)
From: Mervyn Pretorius <mervynpretorius.oss@gmail.com>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>,
	Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: Re: [PATCH v5 7/7] riscv: dts: eswin: add watchdog support
Date: Sun, 22 Nov 2026 19:19:18 +0000
Message-ID: <20261122191918.2184139-1-mervynpretorius.oss@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261015125454.1381941-8-pinkesh.vaghela@einfochips.com>
References: <20261015125454.1381941-1-pinkesh.vaghela@einfochips.com> <20261015125454.1381941-8-pinkesh.vaghela@einfochips.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Tested on a DeepComputing FML13V03 (EIC7702X), on top of v7.4-rc3;
details in my reply to the cover letter.

Tested-by: Mervyn Pretorius <mervynpretorius.oss@gmail.com>
