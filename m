Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186836;
	b=LJ0XahmrQNlSUh4XT5nJsQJULAh4P7jml6wXvsoK40S3YsCR+FKdQx0+EHpjXz/QHhwP
	 aHiK9r+/DX/8zirEU15Az52s9Xl1b87jxc8Rca1dbX3aABKzqYD6vXMxh2PMLd7JP704P
	 a7bQwudPOdfgvdTW9L4ami00dHlxJ63j7xQ2XxT0un4RDgavdUMoytHlHn5p318TBD7dI
	 TLU5rV/muRBgjF0nn9AL55jdHXN6WNU4said74QuRcqKJ7iuerKHa2uOJ2/3My2F5NhOa
	 XNsjJd3cv3jmmfaLvRIXbv0n71mimkcN5t23WbQ0voVa5Hm4oMUR3iSfZZQ4MaUC+/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=kFY3ECIn4NExx9Mc/S3Mnyo0OuWA4JtAPvBIJ+oVIEk=;
	b=KszcQxrasRMgz2OyBIeOeZ8Tl0Gshh1DkU5Pn5lIBRrur2FLrpstv8jwiBgFzrKVbtVM
	 dPJ0bG4OaoMWTlu3sDes1egDbOhR8nsG0XLV2lFr/kYYR4Sf8GWCCiKoVO6kWL8kxz1d7
	 JdKnfTsDOWACVIRHxtxtEeGQzJgdjLL9JxIN4Nbk0ImXHtO5+/Wrvszwul7y0LJVGkukt
	 S5gJMIFoGCWkLRmvy0N8I7XhmsHQcuSpBpnFBNF6chW/24yxypPCJ4bhs7lXRnfBwkHJJ
	 wbmhz/B97bj4IBNrQmSc5BnLKk+GoYyP7Vrna+F8cfhjsIyma3ne0DNRrQL0XpOHrGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Tj8JOOBC;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C12606A82A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:00:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68C12606A82A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Tj8JOOBC
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a594d313a3so753524b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186836; x=1795791636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kFY3ECIn4NExx9Mc/S3Mnyo0OuWA4JtAPvBIJ+oVIEk=;
        b=Tj8JOOBCvBb8sah/JWRGnpnAD+4tf/NKyLWc+8PvCOExzuA/Bky1dIEmbFg2SZnZIA
         STVTKjOCRXtobuhQwSuM/6G+8shvwNhIeiRvaZrKppN6Jwui2xFd3FFjnMblNjOWqDfp
         uZuBdjn2/iif0AM4yL681IBHdQqpLIipdxTr+mW1kadqAAawgYKUIwshhGDr6GkwiDGX
         ti6jJxDMowc9bcOfWXx1umKo8wBuOuAnBZbh//Vc5TjbgebdKa/XrnNv8wnOEW42mqkK
         7V9K0MZeW4bkzLgqAMUQQJrjCaF81j83AWB1Ng/i5tHzEoAh2abwVwgg6tOxGMTHGzXg
         cr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186836; x=1795791636;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kFY3ECIn4NExx9Mc/S3Mnyo0OuWA4JtAPvBIJ+oVIEk=;
        b=QEor4UOXMsut42a5kY8qHLwsodfdOWfvn+KU1e8MdYnZDpZrfZhteZ1wKk8g3gulJ2
         XrMhtxteNcP23psC5j2UE7zzVixVvD55W9VOHYBk+Sw9UbD8HXQM9C6vR4cEtz9OeIZx
         otvFpNYUEGV/nkmrrduDsxQN24B9oO3zgOzPVEKMyGWECmNpXGHHp8bQhLxGFE+25B7C
         9HLzalu1TZEWTjMrodQt8Q82wnYsESlqQKSMUF0S9f8ZxzEjiHEyV2oUfBrl8A/4u+q8
         cdjRWahDFVJnfhnK4bt0kH0voMJJo/XwFKzLOtBQyHtjeoFz543sbQNcOsEjXJ4dHAug
         1KVQ==
X-Forwarded-Encrypted: i=1; AL+hErHclk2OaglhqIRvDYf1BwIZ1sWtQJ/VQxVKWjUQ2ZhKnliIjk2oYpKf9UEkn1xXMbFXLjZcTYO0KGxas6Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VZk7FfMN408cQHZjgFnGblajveLiBJevjM6OyRLOINIXsP8iQ
	I/prjmK9ZjrXVNbDYv6U+9MCD9rMzNmhOD7OfGk1yBmvVKj8bz2fa0ItfRNWAGXpjPg=
X-Gm-Gg: AZFdTZeKfnqLdPGk9uDIXHsEIxB/uq2o5/zMntE/opwU42ruy+z/FKxey+x+5EqyhGK
	GzkNjSeBZT3UBTAlCMIAQWIkqBCW8ZW0/uSAb3Y3VugZGZeDnbYk/H77IHgmRx0HhqXn3JuX6aE
	X+am24i2g/072+80LCPGJqTsiwSbRShBpCwSu1hHPknjxBflZQY8SzD9NepQ0tkVixyiNIN4psY
	f4+bIO3j4dNYmHPn70PnSmweenIT5rwu3bwJSS1ERioNeVw4Yupoz4XFIZYESTFCDTL4noX55Wo
	GTy+rsbf5yJW9p9CFIvXRTlW/kGRbq2UDG/DL35wp6ZR2i2UwABgEerohmpwlMDJGdVl7QqhEVb
	Ca63nSXR0mFG9ohjHECPT4HlQTrMS+g09D8z8cmcWSnG0yRSbhGdOlLpdhGVGFjt/Hfk2hhHhdW
	mrauVgt4ncRKvnpiheBm/tqkyPLZkP/rs1Ne0aZp6nv3uEn+nlKBRnTIkHF28mFzTxm/eAGpylT
	kAiM1bbILm9hDbgwDO4Imr4D93s9HoCD2xSikE2/nhC1RIOEdHvmeOFRV+p1Z3lDPDWq3XqokMW
	fRsUgNhV9dfpHmh+92EHo9K3Rr4Fs4etcFkg3cvGsMQAMk8SvXfw18rVnxEbce1AkZgxJxO+HlA
	VBq8sg1ugjKILgmHY+3rakHESPtUsdQJ2FsAh
X-Received: by 2002:a05:6a00:4388:b0:8a0:1acb:677a with SMTP id d2e1a72fcca58-8c87d806cf8mr3356401b3a.57.1795186835627;
        Fri, 20 Nov 2026 07:00:35 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c272sm1670246b3a.19.2026.11.20.07.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:00:35 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org
Cc: James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/7] scsi: mvumi: bound the values the firmware supplies
Date: Sat, 21 Nov 2026 00:00:31 +0900
Message-ID: <20261120150031.3128191-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015005717.3719956-1-yhlee@isslab.korea.ac.kr>
References: <20261015005717.3719956-1-yhlee@isslab.korea.ac.kr>
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

On Thu, Oct 15, 2026 at 09:57:10AM +0900, Yehyeong Lee wrote:
> This supersedes

This is superseded by v9:
  https://lore.kernel.org/all/20261015045213.3975845-10-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
