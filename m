Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795176629;
	b=QqRdbE6TSemWcAKx9wAeHAHIMEgsi2NJv4QK89RDqikgf3pghXrccOEWUVXe2HzAneWS
	 m5g6sRa0L7gJNu4EcmKsMvo4tLoYoJ70aQ4ZUABDsuJ3bztqE3V31Zoj+tu2oYKOpb6WX
	 I+RADJzRtph6xfQSTkgQAD9o+fq/5Rd9PznKiONPfFNb1vgNyFX8dESQmoalt2BOVnja7
	 OJkfkCMPrrZU3SULtEWvAcHGpIVtr6e863Ney6UhiRqd4aZEtqVFtjelblZiwJn872B4O
	 deZhq0uYLwCRKThSmbPEQbaVszTXKH8xZGT4y0O9KtHY3I/q8n2bqS5RDBIZlv8pQMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type;
	bh=8LFlvhRHi+itjw6FtpQ77I+jdKTUhIGZUp5SZeX1KPI=;
	b=dIMZIqgSh+SZi3R2OJOj3ChqUZf6tzTiartJketgYDE3pCxSnGXcY6K3njdG08c+tHMY
	 pMvrhIrDLCF7zYJrU9h0AFOIYHQpo+g4aZCghKkQ1uTzmS0RUaEzvFYqmRKbe6g3gkla0
	 GGVkrHSJZN/76bs5f1qzpqk3HVYm350L4S0/wzcIpSa8uTRx9vf5HLj8UxisZKvb3MpIP
	 b2zmRLNmm49YPDAAkbuO9vHzsxQuGO0ixrgQnrFa9RSFIh8HN4XGosUPo2Dh8MEfMIbg5
	 T4cC3fB2u9K/7Hz7KYIczHomQu2sQ6/JKdFloyQz43X5lLQTvnM0gBkBfw06d+9aZ+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RIL+PR4d;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5617606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:10:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5617606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RIL+PR4d
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-38190551625so1324380eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795176628; x=1795781428; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8LFlvhRHi+itjw6FtpQ77I+jdKTUhIGZUp5SZeX1KPI=;
        b=RIL+PR4dUY2D2gFM5eLUUukT53gNAUCzYi+3jlouJ8ixCKrysdo3J4nkjH741d2gdp
         aJZdylrX9D+/hu5U8kZYowdTAhtmd/QUfOXZKpCPr1btmhJ2pwyjE5N1aFOoM4rbzeYf
         w5Pg5cYvSqgf7591ApYRRnml7r70HTedBoXv/KUjIb5lkKfhNy1r3Xy5jU8n5sYCHme+
         5NxC3Qhnq6nlRaja7VzHnBuQu/sQl2Y2o4GRNaPZY/6D2XYBzcOX8etwHu5ydX9Zq8zo
         p3cLJ4BDy8dliUZhVecMjBE6Os8InMQP+umSesG0loSbdOO2phEGJjoxdrhv62FPsJMA
         ltnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795176628; x=1795781428;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8LFlvhRHi+itjw6FtpQ77I+jdKTUhIGZUp5SZeX1KPI=;
        b=WMZ5eYP05R8Eh2/Sa1OOzDR2M0nE1bRnJIj4ifibVzZdWK805G0baDTN0fpYA79AA8
         CXsOFtHspCxrOzNAKHZqf5QOM/jl9EcPaeUetr0eRKANHdcss4m5lIIS8NfnStp9pYd5
         DUSet4VGtBmk77/qTlj0qh/AFebjDTNzu/0C452xD3dMum8Cfljea0ZjeDUBpQr0LqMX
         sY2RQEfl4F7FesU3enTMu2UnUl7Ke6qSgvvI4SR9eRY9fRSbdHooFamXg2Bd38LsCA8X
         loH6dNR4PTXb5OMN9oc5eugKhe1DwInRbtNmDMqmR/kIGSOZfGbNIzDjIscvGGE01DE5
         y8oA==
X-Forwarded-Encrypted: i=1; AL+hErGGYvRJkxexpJGnZXNX/AmQbwg5YirEwBjmmlmCSs3OtZeHgg67TlT/3yi2yH9rHIfy56ISbHj5H+I9V8Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VU5CApIrMgBFKqHWju7bHrMxunR6L7IFt4bwn4YEsOqIp/e5C
	FzgFE22dl+YcefnjjnoibD0KGG9mFn820SAkUypOefo0kVZvSAOh8HGB
X-Gm-Gg: AZFdTZd6CmbHXHjjjEkVGHr73a6DxM80n0LCiXAiXWEnd99MtDLGx+5HpRAFi0A7KHw
	ZxUmUK6uvAfD6kkNqNOcwEaUp5XqYgh3Qw4iCnUV5YdcXvu3nbsJrbR97bWH0DREy3FaNy7PSkU
	kGq8GHUugSFWLyJKatWd7GTbBnXGK1huAEazzcI/Hvt2v+SO04/SS6o2shuzQpycyJ6X8dIsXEy
	gzIp1ZHpbXQs2/QmjsnOzNxJo/ikcKXQtCl/UyvjSF5Q0OlXkqMGQOwg68simOId0rRpg9DXsvt
	2d9V30XaPJVdnF1fuPIfICZoE0/PBWcQgCp7OXVC1MbdjDc0p5n2rb7midwsY8fel/A8ML6tWN4
	HpIvyWbzOKkSt5F0UnSddGdGWVo+pP/cw4Tymhj4GFBU8/82LxIzCR3woT+wIJiSJMICEZrQz1W
	thhZkf90LmQJE4hWHDMubS6YQ7Xm6gkTJ/3j9/HoXWCLUfK+hiIAvkdjlT4PXCLPg5ZctKkOAU2
	UWB/Yxy9RLTaBpWwOiCozn7BFuLkRFHpqOKxcs5SV955waPC9Xs4J9GWK3EGcSJtWZDsyEGTHPK
	uwVHgRg98p3IAR4BuZ2cxuipV607eLDB4uv+1VuCg9ZxvwDdixcuvwwn1peUmXgmC65TUW/7Hwr
	ZEEliP93iwUM=
X-Received: by 2002:a05:693c:860a:10b0:35f:8c5d:5928 with SMTP id 5a478bee46e88-3857073f3c4mr2688255eec.30.1795176627592;
        Fri, 20 Nov 2026 04:10:27 -0800 (PST)
Received: from DESKTOP-7QP7L26 ([45.190.211.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385667decc2sm7674429eec.9.2026.11.20.04.10.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2026 04:10:27 -0800 (PST)
Date: Fri, 20 Nov 2026 09:10:24 -0300 (Hora oficial do Brasil)
From: dev12124 <joaoanandalima@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, vbabka@suse.cz, 
    hch@lst.de
Subject: Re: [RFC] mm: alloc__by: create a function for allocate pages in
 small microsseconds in boards no-MMU
In-Reply-To: <4ed0eeda-22bd-4489-ad18-d522b36d22be@kernel.org>
Message-ID: <79570fe0-ab04-7f65-de65-ac34b07334c4@gmail.com>
References: <1ee9b247-6758-c146-2d03-0acea98db33f@gmail.com> <4ed0eeda-22bd-4489-ad18-d522b36d22be@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed



> On Fri, 20 Nov 2026, David Hildenbrand (Arm) wrote:
>
> Hi,
>
> I think we are much rather looking into removing NOMMU then optimizing it :)
>
> -- 
> Cheers,
>
> David
>

Hi,

Thanks! Ok for the atual focuos! :)
