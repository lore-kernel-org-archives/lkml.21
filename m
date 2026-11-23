Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795453723;
	b=plSS0SKGxSEaI+DPKwRxo1WK3EIi/URJi0eI23HcZ5+0WAgR4NNZaLtKBddZFWE1c387
	 tghuf4uQbfZ2iYGv7H41218jmvG+F3ETt3Hjxr/gZ5v8JIpgHGTh81y1hH34hfiVcfMPy
	 +4AUwi6HnYtrMjaLk6/m2dHShh7EMAOEN+ai5vAob1HL+hxtv0FMmz4o4lNG0QSqY9UFO
	 QT09naIMuEDeoU+cJHUERTSOFG/7csMGhhhBcK0Q8TYlVK9PJl0TZTnHqJ6pM7t+6zDgt
	 Ozuxq6Ac2+d5AByPtwJYV5IUzaGooJjoY0GKV/EJl20lF94nEHeDG3HpZEafKhGVQNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5AZ3wJIcIDF0hin1xvRtzHH3mRRXga9TRyYlNiEm5a4=;
	b=UWNk3f9gcXU4pe7LUVs2NwSoocsz6H6K5rQGYDEZfpLNSXoTkx/rDdbz8AgBKGtWApPq
	 8fiPT3KyNaPG/7Fn2YxY4C4re2WWzQnc351yhS/DAAuUovzToMnSo+5GiaP1DpeXUak+M
	 upnTTSq8nigNgwpy72GWYCO4DCkksqv41Vuz1GqCkIDMC13TLAsuWjtiQ4hk53OsR31/Y
	 lwIhJAsvQlHmvQY8sHMOmnMMrItNHJiZKDaVigRL0gs+5Mb34xsVSbxGkrm7Glgx/60LG
	 KxZ8QcqtaIwBT+xy5DimNYKoQnVhi+RVmstRCwak8EESDvsVV1fAP+Guk+VLirpJVEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b="ZkWH/yU0";
	arc=none smtp.remote-ip=199.89.1.16
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98848606A6A2
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98848606A6A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=ZkWH/yU0
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4jYC8B0nlhzlpJ4Y;
	Mon, 23 Nov 2026 17:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1795453720; x=1798045721; bh=5AZ3wJIcIDF0hin1xvRtzHH3
	mRRXga9TRyYlNiEm5a4=; b=ZkWH/yU0wz1gMhn2rdL3BPv8sAH3GjyO5L23MMaf
	9Sbd/hjZ3RnPWxIu3tjQLQcrQ7+uAPgUWV8JqIMLkp+BZQiSpDOHEeuXeJDKJkHy
	WkFfMg23MFvLYS+APev1AIRnnp8WRstfPeDUT1W8hjVVJYHogMgQhkrXspOLy/Sk
	qPtcoR20r3gL0BO1DxyUiT4sn9Zjnf7CI3h78SJOXx05IR1iGUwgSHGM9R63NdWt
	rbKp92qAw2ZVRJ4vik/bdJRJPoI3KZsBZyIM2atyLBNzsLHferUXSYRvR0gLEvIa
	y/Wb2mDDaf0MznEisU/Ux9axzPyB09mpLqSbjeXemZdzcw==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id NZ-Sy4hLP2mE; Mon, 23 Nov 2026 17:08:40 +0000 (UTC)
Received: from [IPV6:2a00:79e0:2ed2:d:ea1d:378e:4edd:cc5e] (unknown [104.135.182.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4jYC882KZ5zlfvqH;
	Mon, 23 Nov 2026 17:08:40 +0000 (UTC)
Message-ID: <e19b049b-330b-4cc0-ae9d-1936a44a6979@acm.org>
Date: Mon, 23 Nov 2026 09:08:36 -0800
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
Subject: Re: [PATCH v3] coccinelle: locks: Add must_hold.cocci
To: Marco Elver <elver@google.com>
Cc: Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
 cocci@inria.fr, kasan-dev@googlegroups.com
References: <20261123104616.226112-1-elver@google.com>
 <4f7c329e-d722-427e-8279-14c55fce7d71@acm.org>
 <CANpmjNP5DqQwUuO5jKOK=KM9njyBNnY5xHbL--QF=r3ZjfRELA@mail.gmail.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <CANpmjNP5DqQwUuO5jKOK=KM9njyBNnY5xHbL--QF=r3ZjfRELA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 8:27 AM, Marco Elver wrote:
> Thanks!
> Ack or Reviewed-by?

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

> Aside, do coccinelle scripts go through a specific tree?
> Otherwise, I might just take it through the -kcsan tree.

I assume the above question is for Julia?

Thanks,

Bart.
