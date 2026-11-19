Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099664;
	b=HAsw27Se7m1TQ7Y5tA1V1NnovkcCbXy1RxzoyG7Lks7qaMJt13CziNXn9qhYIoieWU3h
	 uqIDBcoxwhu85WWkTvi3nxht9RWk6aL5IqWIiM8TyyUgHTgJOX80o2C19+d1NSaDV72vE
	 yoH+blWEHu5weHx9Ar/98fpvcVCNaiyq1OAhD4AYTKjHAAW+Wk+qPl5L4yyAzOG25BZua
	 BgruGbqe598H8dN0ICan6e0zE4JE+aryhg5ArrKre0TI3dTk+quwsBzw+0Jrf+9aNAeE6
	 AMQrH+/I8tLXDZ7dqyoYy2oNzDGRcwD5JKOc3b7q0Q9Pps+puBvPrXcqZwsrh8km3mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099664;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=LjCOM/Kt8GU+Ni1IhpRtuoflkRpQY/1j2IOKF0/pJ1g=;
	b=ie1DjqOlYEtZzZqEReUMn0WYU/3ZT0Vg35Sfhyb8if+7VXiOHREO6PSeIGCVr3xAb84y
	 azfmxK94iTQ3g6LVD0U104ArO6ZBNme+dks0HbNcPyZH2jSHQ5iSV0G8vh5F1295ZNvrE
	 LO1O03eCabLCaSF0nYRBuOzYqFOceQ+4rJMBiprf2kTY/108tE2KZKYVf5oVfFz81FFWR
	 sQGtSsyNy+51CyAn1O5d6uBmh3w3b8lTX5Fnu7kCwZZMjvr7uvo/85IPSAXs1a6z5nmD+
	 Dbh3mK6ry8woP5HnUlibqhJptWG5luvBCCmqxuu21qRgLcY+N/GvVzcK7pfx2IPE52Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=dS+cNPry;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45021606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45021606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=dS+cNPry
Received: from trampoline.thunk.org (pool-173-48-114-214.bstnma.fios.verizon.net [173.48.114.214])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 6AJElaMw017857
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 09:47:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1795099658; bh=LjCOM/Kt8GU+Ni1IhpRtuoflkRpQY/1j2IOKF0/pJ1g=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=dS+cNPryPZuiBmtGgo954etKZD4qykB2FzJl4c4JalyK4bMCaNCdO3Z1PzB3pnPEz
	 PMsquKEaz0GVGT9K6DABEQf7RbVB1kkUHouHbshr90bzL5rOye5y1BdZi3WJ0iDzso
	 tdd7Rkhfa19mrQsiScI/4MFwav6GNTp1pZL7pB0e2cRt4/41ROYcsLMUZPA9I/zMJU
	 o301oXZmpaXw/xAEsa//qCQ0iml0XpZWf8WD8fH6C6ScUCiPhIcub4dgvgTlTDCFzX
	 AmHT9t2JtWhPqeGdUeqi30NlEETP3tJLCI7oRCtRxGJ5PLqxRmD8+LSjXT3URoIgKZ
	 UG+dBXUI4UAWA==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id C19392E0148; Thu, 19 Nov 2026 09:47:32 -0500 (EST)
From: "Theodore Ts'o" <tytso@mit.edu>
To: Ext4 Developers List <linux-ext4@vger.kernel.org>,
        Jan Kara <jack@suse.com>, Andreas Dilger <adilger@dilger.ca>,
        Amit Patole <amit.patole@gmail.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] jbd2: document the h_invalid handle flag
Date: Thu, 19 Nov 2026 09:46:36 -0500
Message-ID: <179509948725.1938961.4022274080118425750.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105-kdoc-jbd2-h_invalid-v1-1-4bc224f7d0a2@gmail.com>
References: <20261105-kdoc-jbd2-h_invalid-v1-1-4bc224f7d0a2@gmail.com>
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


On Thu, 05 Nov 2026 09:00:36 -0500, Amit Patole wrote:
> Commit 61e2a90a910c ("ext4: enable scoped NOFS when starting a handle
> in nojournal mode") added the h_invalid bit to struct
> jbd2_journal_handle but did not add it to the kernel-doc comment above
> the structure, so kernel-doc now warns:
> 
>   include/linux/jbd2.h:523 struct member 'h_invalid' not described in
>   'jbd2_journal_handle'
> 
> [...]

Applied, thanks!

[1/1] jbd2: document the h_invalid handle flag
      commit: 008aad6508e30cd1bb6d2c2cf65221ba1f16a065

Best regards,
-- 
Theodore Ts'o <tytso@mit.edu>
