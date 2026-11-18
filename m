Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992574;
	b=bucB2W9TMWfQuFZaVyX8QJCgearQQ7YbTRw/26VJ0Tj3lJpaSWD9MKYBn38aNi2YoDnF
	 sHmk0/gz7RVVXo++B/3BMIKvpNMxWQUP+OWxeyJXqX6g0NeDaxa4Pe8Wh/kudDvJ3M4Vw
	 HFALuYdNCYz7eX+B6h0ITzfMe4gPZEldNqyRJWlXj5vqsFjTD6mrvyk+xgGU6H16lvA2u
	 sed5VsFJh694IAwg+uJEt1kWtyjyU8iSPMAlW1Ds7Tn5znan0Y8fxotBIY6Qpcvu0A952
	 wOD6eQAWoyVEmQ5eNFmCDuTnZpJ/ezlDDR2nLmCPxllFvAlxOukUWI5zdzLN+GWNXeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=TMv19XzBydjO5aL38YU2E7OmGv6/GTdijnJuqThzR4E=;
	b=kRi4PLM2FQqPYeXm5RLWhDgfla+NpgX5siOnhNawx0+JEri5gdXB+cET0/VucPIRfBwd
	 1Z9sWK2DBpKlR1CCecFzlvfcxwFQKEbyD3c1QT8CqUrhmaEyvvo94d+S2lUEZ7jpCWMTA
	 5iwg11BqtzL2bKE9v7LRcPVDo5z39KEFbSWyGuDHKPWHVh4KJkTLfIX2wKXruGYQfrMfw
	 BnWdtaqbg2i5TEsDAUIcQqdCtgGD7fxFbiRE3ipaP+y/+8NkEGSBwbPB2LmFduDjmbAZz
	 X4VQoJ5klyFz8VXKpQ39uNHLpyhXXowW9XkPHoHLDDYPE0wd8e8BAP+GTx9HSdbgo6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jFYcflQW;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D785606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D785606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jFYcflQW
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso373447f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794992573; x=1795597373; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TMv19XzBydjO5aL38YU2E7OmGv6/GTdijnJuqThzR4E=;
        b=jFYcflQWi0KiGrvAIrYwGd0IhxRJsPZaaz0xMt0Zg88+3smh1NaWOYEDbv6YuGSxnT
         JBqpzr3592IXDkwMsdm0IDibtktBVlN1pHF604H5IbgcU9RFWs1KmGdflNSHOmoccLo9
         C5+PQPqerTi+/ZHrdYmwmOZuLcQ7LkO9fgKwS65K/KqMFDX+8Ez+Hb0RXIeqlFHUMQ4L
         8vyrO5DUFI/1hYqZMYJQn1/qmbzub/uxWScRYUIuI8n3VBTQM3ptlBgP3dFzyF4SfChM
         lsNJ++M5AX83DtWAmMjT6QJwSMWm9NNdgxS+7Zn0lMRhjhq1phaKPSzG5OKJlvOKTM+N
         KgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992573; x=1795597373;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TMv19XzBydjO5aL38YU2E7OmGv6/GTdijnJuqThzR4E=;
        b=lFeJTF5sq8cNB8dsphElCbTaTHpH/aRMxM6xNY5ETERdvI1wrd9qkdUBka8X37WQ1h
         FrvDhOFnEAzo0R/bnpZC89WM34UXJjk1I2H2mEqFedDWiXUIgffMOCAByZ/2badclBMv
         2EanSUDl0bkcAiu3d4L83CzPAAMUohwb3/M1l8d+FZO9bEaLgCX7B5p+SfBpVKazNN27
         mPxsMzYPT8IAot9N+zucY8GdXcM02Tr6zFRtVIPIzJmo2U0JrzWiX0XjgoOXjef6hs5q
         FFFOEcjU8uUpcLeVI0kwrzAnVcvFyW9CjqnD7W/VbBVD7jk9ZVLdxVKb8QGWZfR5bDOw
         JpkA==
X-Forwarded-Encrypted: i=1; AL+hErFhaBv44ppJQk0VBwQNOWqoiP21yXvagmPC4OSIeWe65PyAOXkiobEaxjSSnZO0Y1GAEU5byTyg/HkrnMA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XYiEboc7NxAzKDNQvD5OsoPnY6m7iW8mUsOFqgx7Mb+dnUW1m
	s4jjvN8KBJd8rUl+FQf9+5D4G+EkRbtzXnEu2morme7UJDfwccr+r3tbWJqnvZim
X-Gm-Gg: AZFdTZd/fXy06MmPAV2WrOBjaIYwYRwxex6DY6aQL5a2bKjNe7/ZC2PAv12oyX/Obdu
	y09CclWLD6uNAEeoAUxkFb2UcY3i5JlNAs8tMSzaP03G2DluMgjyoz3w04Qz2thvH41U+cdzlCP
	SsAqPcYlBIcNMRHzr4Q/D3KZkqJAPJ/b/7aX72FHiW8U/9iMdxkaTk+1vtMQKumKt11ASjhXhBO
	nWJKY7IIUd7qWjP0yFbDo8aAWDGfutBKhF2vBH/ZoqPfEbC8xBT6goS1XBdABK07TqFURA957WN
	ebAPm8RewKSak7AQ81Qg8b8IatrYy6mLEzkqbMO8x2ir11dYRpuwXuyaU4RRTg1FzebN/CCtYij
	0J7gAs5c/sAPvW40wKWHVays+8+L+t8m96WNXPeqrIkNBB/LGWnkhmsrAd7mxqTBeE4hS6VsNVZ
	gQbd26jdMxc9idIYP9BQDe3ShZifYDYsFBA9nouQoTsAzl6C7WtZAiO8cok4spQwIO7xat9rV/h
	ZWQQ3uQd8wn4nPBgwaXWlozo0vEMaORg1wiRbrwAz0LmfPPgpfSAupwouNraNq/18zODLN5OLd1
	2qFf+F9MMsxpk6tEVONfVasgsMGXJ3ndZJytgSNlhgBXyf9jXb9M2nu45rqk4dCf3Q==
X-Received: by 2002:a05:6000:4812:b0:492:a72:9303 with SMTP id ffacd0b85a97d-4a63b9d9635mr3815055f8f.22.1794992572498;
        Wed, 18 Nov 2026 01:02:52 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm3475452f8f.18.2026.11.18.01.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:02:51 -0800 (PST)
Date: Wed, 18 Nov 2026 09:02:50 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: Linus Walleij <linusw@kernel.org>, Michal Simek <michal.simek@amd.com>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, saikrishna12468@gmail.com, git@amd.com
Subject: Re: [PATCH] pinctrl: zynqmp: Ensure function names are NUL
 terminated
Message-ID: <20261118090250.2ae9258f@pumpkin>
In-Reply-To: <85ff5be0-4fad-4d92-b9f3-2553c7c4365b@amd.com>
References: <20261117073947.1100444-1-sai.krishna.potthuri@amd.com>
	<20261117131616.0a631d5c@pumpkin>
	<85ff5be0-4fad-4d92-b9f3-2553c7c4365b@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Nov 2026 14:08:16 +0530
Sai Krishna Potthuri <sai.krishna.potthuri@amd.com> wrote:

> Hi David,
> 
> On 11/17/2026 6:46 PM, David Laight wrote:
> > On Tue, 17 Nov 2026 13:09:47 +0530
> > Sai Krishna Potthuri <sai.krishna.potthuri@amd.com> wrote:
> >   
> >> PM_QID_PINCTRL_GET_FUNCTION_NAME returns the function name in a fixed
> >> 16-byte field and does not guarantee NUL termination. A 16-character
> >> name fills the entire field.
> >> The driver copies this field into a 16-byte buffer and subsequently
> >> uses it as a C string. For a non-NUL-terminated name, string operations
> >> can read past the end of the buffer into the adjacent groups pointer.
> >>
> >> Reserve an extra byte for the NUL terminator and explicitly terminate
> >> the copied function name.
> >>
> >> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> >> ---
> >>   drivers/pinctrl/pinctrl-zynqmp.c | 7 ++++++-
> >>   1 file changed, 6 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-zynqmp.c
> >> index aba129ead04c..c778133fadc2 100644
> >> --- a/drivers/pinctrl/pinctrl-zynqmp.c
> >> +++ b/drivers/pinctrl/pinctrl-zynqmp.c
> >> @@ -29,7 +29,11 @@
> >>   
> >>   #define ZYNQMP_PIN_PREFIX			"MIO"
> >>   #define PINCTRL_GET_FUNC_NAME_RESP_LEN		16
> >> -#define MAX_FUNC_NAME_LEN			16
> >> +/*
> >> + * Firmware returns the name in a fixed-size field and does not guarantee a
> >> + * NUL terminator. Keep one extra byte for the NUL terminator.
> >> + */
> >> +#define MAX_FUNC_NAME_LEN			(PINCTRL_GET_FUNC_NAME_RESP_LEN + 1)
> >>   #define MAX_GROUP_PIN				50
> >>   #define MAX_PIN_GROUPS				50
> >>   #define END_OF_FUNCTIONS			"END_OF_FUNCTIONS"
> >> @@ -650,6 +654,7 @@ static void zynqmp_pinctrl_get_function_name(u32 fid, char *name)
> >>   	 */
> >>   	zynqmp_pm_query_data(qdata, payload);
> >>   	memcpy(name, payload, PINCTRL_GET_FUNC_NAME_RESP_LEN);
> >> +	name[PINCTRL_GET_FUNC_NAME_RESP_LEN] = '\0';  
> > 
> > Too many constants....
> > You might want to try embedding 'name' in a structure.
> > 
> > Then, at least, you can use sizeof().  
> Ok, i will define the below structure
> 
> struct zynqmp_func_name {
>         char name[ZYNQMP_FUNC_NAME_LEN];
>         char nul;
> };

I'd try getting rid of NAME_LEN and just define the array as size
RESP_LEN + 1.

David

> 
> and initialize them as below.
> 
> memcpy(fname->name, payload, sizeof(fname->name));
> fname->nul = '\0';
> 
> Regards
> Sai Krishna
> 
> > 
> > David
> > 
> >   
> >>   }
> >>   
> >>   static int zynqmp_pinctrl_get_num_functions(unsigned int *nfuncs)  
> >   
> 

