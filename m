Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795257885;
	b=TUEj43dUmjgovksJuTk2kklvCQH5AOBoqqOh7Cid5m2g5D1IgyqsU7civNpx+dN3LfAK
	 dW2Me0DNzsdsDj4iPTa56BD1KYphoARdgGNxeLwtTzj5o12nspaRRoqmiQxppJAu0HWhQ
	 p7c04+oxLI77K+Tpu9becd/xYFC3jwuV0hXpHJvGm8CFKdIuV6mS6poq4dtA0qcuY5T0b
	 sFrrtHdLxF2znp8q7FnTN7p6gOjD6NTkZx59WkXHIS1DEBlLpJ+pYXk4vWta8sPAqmdQO
	 VwZE8S5r5NEO1RUMWOsTFcyvL40ssI/lKfN+WPkqCnF1b7/2OBEnvftES9JZqOz3A+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795257885;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=6CDS5jsykY2tmpx/HC0dDui4GWuFilg6j81uj+xMFWw=;
	b=gD1BiAwyJCYOCQYQak6YNdG0I2JU+cbDhPL/iCkg+O+8QY/dhan2lNDKzbDU+7iRCk7t
	 NQonbEcw2XVTyYHgvRTD2baAu8jpikqvUg+QdhwI1jQBG1HmvwRl51IEsaSFT+rm68k8C
	 VYOaSeasFFCsarD6V78NTGzF+UQU7IQUaOAptAnWuyp9rQP2W5WuctmvZwZfzwHhQbcpI
	 NS8PJsZVPmmnlPtqaJE5pJxqAbPHTfzEISv8biJjga3H/v9CkFD6no5iKBInoFuc7eENX
	 W4njhdISdT1B3ph76KcKd0au6oqicWF07inT0ZAqFvoFA8Q0nmCU4IzJBNd20Fl9pEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=jVYeMYDm;
	arc=none smtp.remote-ip=79.135.106.98
Received: from mail-10698.protonmail.ch (mail-10698.protonmail.ch [79.135.106.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7820D606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7820D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=jVYeMYDm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795257882; x=1795517082;
	bh=6CDS5jsykY2tmpx/HC0dDui4GWuFilg6j81uj+xMFWw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=jVYeMYDmolld6i19Iw8VvEBpZyAnufm6dWe0PwbzvCfvzHCYfW0/XBqcOfs7zO6ZT
	 dhPeII+eiZxWbqKUtfOp+nq5XHlSOSAJsQVWFcrtn6I3JeVB4KeMe8eG9vLTU+N6+f
	 uGaCbNeHekpQH675LuzYEyeX+jTM+EUoCt5a+iy8bvxJJmWMG3/8QtKKuV2rTzsJdx
	 ejkRmrtcUV5DbgN+4O93xnebibIERdEEKsgjJs8ffHR39UoAkzNhKBUOgOXsLQvM1o
	 ngH0qmEvY6t2LipjOYgzuI7r60NOf9RsysS2L4w+Q62RiFg1GdQY6og3aX6bhda9wi
	 3VcikwkFFw5wQ==
Date: Sat, 21 Nov 2026 10:44:38 +0000
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: New NoisyTCP Linux Kernel vulnerability lets attackers crash Linux servers
Message-ID: <f8K_cO2BtAALe7VsLn9GTBIHZAk8nBZ7eTPjhzOUYNTEkdfA8dcRraSsq9UZI9WBFUDibjTCrg6w2KfEXYqOHo_BdenWq1gbUh80hNQlWao=@protonmail.com>
Feedback-ID: 39510961:user:proton
X-Pm-Message-ID: 923a341894e25ca0dd5718287d6f2d736c52ddbe
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
Content-Transfer-Encoding: quoted-printable

Subject: New NoisyTCP Linux Kernel vulnerability lets attackers crash Linux=
 servers

Good day from Singapore,

Here is an article which I would like to share.

Article: New NoisyTCP Linux Kernel vulnerability lets attackers crash Linux=
 servers
Link: https://www.bleepingcomputer.com/news/linux/new-noisytcp-linux-kernel=
-flaw-lets-attackers-crash-servers/
Date of article: 16 Nov 2026

Thank you.

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Targeted Individuals Singapore
Government-Induced Schizophrenia, Government-Induced Health and Medical Pro=
blems, and Government-Induced Extreme Poverty for the Past 20 Years (Govern=
ment Persecution)
Why is the Government SOOO ADAMANT, INSISTENT AND PERSISTENT about maintain=
ing Absolute and Total CONTROL over all of my Android (Linux) phones for th=
e past 20 years???
21 Nov 2026 Saturday 6.41 pm Singapore Time





