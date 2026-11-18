Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992431;
	b=cwdOM2h6Jt4brO4aEPMelUmtzC0ICYo4ICON0P/gmqbOChAlZss5E5bFL/xTfl8lpjY5
	 NN0LCiT2mPHIgmG8g3+sVE1QglpFV1UmhYkS2qxejNPzwltubLHfIy+0puMSArlEaX5v+
	 VZqX3dpntsq7HgaQaVOs7qCxc4S1Dzr27N1FlukJcg02TSYCri7NN7zC7LdeHdDJMgmz3
	 PoZf5hsZd8FbBTeyiFsWtR6qDbV18RlucfBADHaw8i/42uvJ2k7C3C0IHUkQuJyNGvhvp
	 9g4kSbggck1CYRpcptsqcC4YVfoY6jhm9vSYhTL/JeFwueLf+tj1qCDAYd1/sli/afw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=1J9aLUOWfs4AT7gYXjQA1mkmgTZ5ck2P77/Iu/xB0LM=;
	b=mpQd9aVf6/Jmx6Iln930XOwao6NVPiM8Mf4oc1F2Oh01tWJzqVf+DRaUHO6b6z/RX9Mb
	 dtDPyDpV8O33XrdA0HKm/QTqYDyyltC20sl1oGm5rqASyDGwcO6G7p/YKhhDK+8H8BIj0
	 hhPcAS8F6SIzASNdhd9ENQDMEbD2fUymcRhQLIrbwb//0+3VUha8/bTov0qR+SJKTMzNW
	 UhoDhB0R3ynRB46he6/J4xqzFC11vhGmke7NFBHIuxquQojfsX1fPx07tYdl6RCoNTCx7
	 fWqYjL34TWm+qFoMuoBLbPYIj5NFU3zrJWxOcAxFju29ag4T85VlpV2Mi5ka7RORB3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eTuN2E7V;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B55606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65B55606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eTuN2E7V
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so7992985e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794992430; x=1795597230; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1J9aLUOWfs4AT7gYXjQA1mkmgTZ5ck2P77/Iu/xB0LM=;
        b=eTuN2E7VptcBagOB6yPe/nICiYYJBgFkSjKUjMDCup3J1jwKp7MV0mFZ/xkrbhC62w
         PwK1Sf9DD/bNIMo5IoIqjX4tQEXCFdSaCy4p/DJAPlggj09m4lzyubCBUirw4dOv+gIU
         NtzYCXPbavBtL1sIrZyC2xTDc3+90v0itOjc12VYke2lYu8jnsuhzDGCVqnqm0iJGjYs
         Ia9ZEH5+QqGitLGKti646Ph/fHhd48IkKsgqacoiafy8hzIKQIeRD23Tbwh6JjFIQv8V
         N6OpnkuvmkDaQ4bJ22+B/lIGwukEnVfKNe/Ic1cYprqxWWcMnKX+FBtkfVQnjp7EzRZV
         I96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992430; x=1795597230;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1J9aLUOWfs4AT7gYXjQA1mkmgTZ5ck2P77/Iu/xB0LM=;
        b=EuXOPqrzfE4xvhPMPG/0KioGRpDSB0gjbvIgmxd6gIB1yrmp6dbds/W7nzB2ldOJZK
         ivCXQm23wFfOphDvIPIgTyOGAz84Z4/FUU9OEAd9DRXDXeueDMqmPXQnhWuxbj+7uiIA
         jIrYr46PlPIJN/8JXEGMEAtsDJFIf+CPbHx3RbZ/Wbi0tFRXi1RElJBvuCi5KqotZWUH
         T4sFGdrj/rP+f5I9bE75kKHqzoG8Ww2K9ZNi69PRUi0B+odXaUBtXH8RBTO42j8NAKdH
         A2QUr1t5oThTZGekQeyI7nLQP4gtYIKze1WYF2Po7rdjAdQm6owv5FJuVQGOqrh1lfH7
         x9yQ==
X-Forwarded-Encrypted: i=1; AL+hErHVQRYLMETjdVkmHL+i/AKvFUbZC5A6aNWu6QzGy8NgYdO99vZya/9O5+B5eIe4szYevf0ISeXlkRfVwyk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8m5/uNVfiWnjRvcWtO8ylVcla+kqmVK+8/CU5GaFyuTmdXaEHK
	a3AZs7PcDYkGUy0P1BLSZPIJn1TaPFmHtSoSGxxFldI56hW/StKbXcQozJng8EAjhoZhWHtP
X-Gm-Gg: AYBFou3nt1aRVc59ACJ4Qz12pZzEEJlWlQnEcP0I2kiYOpwdecNNVlgS2DvExbg03JV
	zNH24KmaQgfTj4Igr7ZezNoIqIvFiqX0bMoldmBRQzDQJIKQpXfnarrztYQivrbVc1+3uZ859GO
	0zgormpda9PzmPdK2vrWs2T/8K/5Te7qT51H8Yl4Btha5a3Z6ZUd410R4B+gaKp56K4HmI0GMf0
	E7dP4dxxeP8ky2ChAfPpdXiQxx0jdVNHeE5cwYI1rEdqqo8f5WIcGkOuzTfrxAqNI+17IIEnFMW
	wggcaNRxUuzR7DTqyncjWONkBbbzpMpPB8M8pr+xu0sdoCIRgtJ2NUVaJhgxqhz50Mb5/ufSRDV
	sMF08S6Sa1+zWfb2p9ItbnEAjQUi8jZ+TwCJGRod3MFs+jEpMO3iTPNju3YRdOAGo6pZ1diMyjG
	E9Bf12sZGDuF94c4/hIRnyWWUfYd/nWeBV+ptez/AmHpF0Kkm+C2LwhbcK6Rzg2c7k7g8+ncnYc
	jxv3Fm++/Kn6hBV6MIMfUo3XoJL53HEdS6kz7jJTK43V8amgBeniUkdDJ+kJS6XEjVqGw4gRD9I
	lMAdKjeWQHfQectb7nW7AXRczuKly7/ZmlN2tMQh8O8Kstfn0ZSW8GqJkgE79Th7vHrONQ7qPRu
	5ixWAu/kvP/kLYcxKQO1a9Is85aRc4IAf6bpBifhxRmG+e5TlmvNn
X-Received: by 2002:a05:600c:4e11:b0:4bb:6a2d:b438 with SMTP id 5b1f17b1804b1-4bb7d578be5mr38973015e9.0.1794992429444;
        Wed, 18 Nov 2026 01:00:29 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8220sm126529375e9.5.2026.11.18.01.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:00:28 -0800 (PST)
Date: Wed, 18 Nov 2026 12:00:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: Garrett Floyd <garrettfloyd345@hotmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio: add size enforcement to name
 prefix in topology
Message-ID: <av1pJIssLeNxZiIS@stanley.mountain>
References: <DS4PPF67BA2A7859950C09372FE7397AAAFE67A2@DS4PPF67BA2A785.NAMP223.PROD.OUTLOOK.COM>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS4PPF67BA2A7859950C09372FE7397AAAFE67A2@DS4PPF67BA2A785.NAMP223.PROD.OUTLOOK.COM>

On Tue, Nov 17, 2026 at 08:44:33PM -0700, Garrett Floyd wrote:
> Copied name for certain functions can be 32 bytes, but destination is
> also only 32 bytes. After adding prefix, name may be truncated, causing
> compiler warning from -Wformat-truncation.
> 
> drivers/staging/greybus/audio_topology.c: In function ‘gbaudio_tplg_process_kcontrols’:
> drivers/staging/greybus/audio_topology.c:1172:65: warning: ‘%s’ directive output may be truncated writing up to 31 bytes into a region of size between 17 and 27 [-Wformat-truncation=]
> drivers/staging/greybus/audio_topology.c: In function ‘gbaudio_tplg_create_widget’:
> drivers/staging/greybus/audio_topology.c:1090:51: warning: ‘%s’ directive output may be truncated writing up to 31 bytes into a region of size between 17 and 27 [-Wformat-truncation=]

Just ignore this warning.  It's stupid.

We're using snprintf() as a belt and suspenders approach to preventing
buffer overflows.  If it gets truncated that's fine.  Great even.

The fix is to disable stupid warnings from W=1.

regards,
dan carpenter

