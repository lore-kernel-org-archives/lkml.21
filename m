Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108269;
	b=cu30vdiX/2pAKnBWHRrDLrEHCtbvCdgHSxmgui6FWVcAOX5dICHYAPXYCyMXPnpDbNE/
	 8JOsfmiRG2XQvKASp3A8Z7DqpoWJHQAptZGemsgBFsMoAQi+xg8u9KTGBfMEr1qmteIi/
	 oesBk3YH6oY3KhW186KKWjkv96qHK2YDytPyo7d/Db2AntXaAfRzgXaj7+dd7BFJwq9t0
	 uZsvrf+/u9YOQZLpYtIdcv+/xd+GGYedy1DU8uo7OUX+U9Am9a4Cu/119uY8I0oUH8xMg
	 YXttCIRBts1cmgk6Ks9IV0eJm2bx621Ns/1bhjXqqQ2jopszqBlQpczc/0p7vYrcx+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108269;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:User-Agent:MIME-Version:
	 X-SRS-Rewrite;
	bh=rzYS9GIa3Uq8/81uPejJcMtWDeifrHDbYdEvo9lPFe0=;
	b=dQyR2Dlr9vdSc8C8sicqCtg/jmBmSBZFqvDgebhbsmtVUzNGeS/Q8lq1Hx+xJgDfvbQc
	 dAkBKhgCZjdoEcDbuTBCjsnXWT1DjuKu0629GjylFtfzzTODk7OzCaU6GMNxrCPC05MI9
	 j+mBULxOBdyUpIbsRlN12uYCuNWolvBDHamG2pkJ/pfftadIPt82CbPfMwVcOeEdXc4i8
	 qjnKpuNp1gpmaygtjFW5jJG9QbxTpPU1p+Hbj0QCn75YvMgVpsvabla2Nh33ATXa4IpCq
	 t3mpz48xLfnSmUcdAQ5fJOjh5osrKMfydkAIAKWq0Rw60WPnLh9h5qRTqIH2REY9r7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=none smtp.mailfrom=casper.srs.infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=iuG4u7OT;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6514606B40D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6514606B40D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=iuG4u7OT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rzYS9GIa3Uq8/81uPejJcMtWDeifrHDbYdEvo9lPFe0=; b=iuG4u7OTbP0sr6EyJivLPnwby5
	vXSGVEy5CnBHp9grU3RGXQAe+jlyvTyEHzw8qwSXAYkDOFJBR5XpWIajGgJsLwEfg8RjomRANSTZ0
	bsGV0SkpZPbfTJpBwLWAhRMrqrKn39FOjv+b6DSt9o7eo953nq+7nSUjFCvyATr9YCLAUKNQNIXOi
	ZrVhHia91qT5QgbzikN2bRtII51xOwlZcptkod7jcseLyW0SBnTszbJcTBXV2mOqTkPO++JIPxDYU
	7C3Lmz7ob97g6bsesNN3i8HYh0yi7WUdy4OqFeOtWtEgiE+E+JfZGUKGEQkGk92GucT3KxtjFB4mm
	0dxbRBdg==;
Received: from 54-240-197-232.amazon.com ([54.240.197.232] helo=freeip.amazon.com)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5f3-00000008JoA-3jF7;
	Thu, 19 Nov 2026 17:11:02 +0000
Message-ID: <e280fa68d0ba8e167402b53363a554b2e7c83cee.camel@infradead.org>
Subject: Re: [PATCH v2 1/6] timekeeping: Allow tick_length changes to apply
 mid-tick
From: David Woodhouse <dwmw2@infradead.org>
To: Thomas Gleixner <tglx@kernel.org>, John Stultz <jstultz@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>,
  Rodolfo Giometti <giometti@enneenne.com>, Richard Cochran
 <richardcochran@gmail.com>, Jie Wang <jie.wang@intel.com>,  Yuan Wang
 <yuan1.wang@intel.com>, Ryan Luu <rluu@amazon.com>, Julien Ridoux
 <ridouxj@amazon.com>, 	linux-kernel@vger.kernel.org,
 nh-open-source@amazon.com
Date: Thu, 19 Nov 2026 17:11:00 +0000
In-Reply-To: <20261106030856.2538039-2-dwmw2@infradead.org>
References: <20261106030856.2538039-1-dwmw2@infradead.org>
	 <20261106030856.2538039-2-dwmw2@infradead.org>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-omMEqip56wa1pnHtqwLW"
User-Agent: Evolution 3.62.0-0ubuntu1~ppa1~24.04 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-omMEqip56wa1pnHtqwLW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-11-05 at 19:08 -0800, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
>=20
> When the NTP tick length changes, timekeeping_apply_adjustment() applies
> the accounting for the new rate to ntp_error retrospectively for the
> partial tick which is currently in progress. So the ideal line of the
> clock conceptually changes from the moment of cycle_last (which can be
> almost a full tick ago), and ntp_error grows to show the difference
> between that and what userspace actually saw already.
>=20
> Commit c2cda2a5bda9 ("timekeeping/ntp: Don't align NTP frequency
> adjustments to ticks") removed the equivalent alignment term from the
> old accounting in 2018, precisely so that a new frequency took effect
> at the time of the update. Commit b7befd6d9120 ("timekeeping: Account
> for monotonicity adjustment in ntp_error") effectively reinstated the
> alignment, because *some* accounting is needed at that point =E2=80=94 th=
e
> same retrospective mult change also carries the dither and skew
> components, whose divergence genuinely does belong in ntp_error.
>=20
> This can lead to a significant value (10s of microseconds) landing in
> ntp_error which can take *days* to drain through the natural mult =C2=B11
> dithering.
>=20
> The slow-draining ntp_error then applies a consistent bias to that =C2=B1=
1
> dithering, meaning that the precision of the effective frequency
> requested by userspace is limited to integer 'mult' values, since the
> dithering is no longer effective to achieve the fractional parts.
>=20
> Jie Wang reports that this makes phc2sys take minutes instead of
> seconds to settle CLOCK_REALTIME after a step of the PHC it follows:
> the servo slews at up to 10% and then backs off by several percent per
> second, charging tens of microseconds to ntp_error on every update. On
> a gPTP setup (ptp4l + phc2sys on back-to-back i226 NICs, PREEMPT_RT),
> the time for the phc2sys offset to settle below 100ns after a 1s step
> of the grandmaster's PHC rose from ~32s to 200-400s or more. Yuan Wang
> measured this patch alone restoring it to 32s across three consecutive
> steps, with the steady-state lock (~8ns rms) unchanged.
>=20
> Fix this by allowing the rate change to be conceptually applied at
> 'offset' into the partial tick, rather than the start of the tick.
> This means that the amount of delta which gets accumulated into
> ntp_error remains low.
>=20
> Rather than factoring this into timekeeping_apply_adjustment() which
> already makes my eyes bleed, pre-correct it when the rate changes, to
> adjust the 'intended' clock position according to the delta between
> old and new tick lengths (but leaving skew as it should be).
>=20
> Fixes: b7befd6d9120 ("timekeeping: Account for monotonicity adjustment in=
 ntp_error")
> Reported-by: Jie Wang <jie.wang@intel.com>
> Closes: https://lore.kernel.org/all/20261105032150.1763572-1-yuan1.wang@i=
ntel.com/
> Cc: stable@vger.kernel.org
> Acked-by: John Stultz <jstultz@google.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
> v2: Pull the dividend/mult restructure up from patch 6 so the old and
> =C2=A0=C2=A0=C2=A0 new calculations match visually, and rewrite the comme=
nt explaining
> =C2=A0=C2=A0=C2=A0 the mid-tick compensation (John). Add the commit archa=
eology, the
> =C2=A0=C2=A0=C2=A0 gPTP symptom and measurements from Jie Wang's report, =
with
> =C2=A0=C2=A0=C2=A0 Fixes/Cc: stable.

Ping? Patches 1-5 of this series are mergeable for 7.5 but this one
wants to go into 7.4 and 7.3-stable.

--=-omMEqip56wa1pnHtqwLW
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCE8Ew
ggWvMIIEl6ADAgECAhANkOKMSmGXhF5eMl0rsRhvMA0GCSqGSIb3DQEBDAUAMGUxCzAJBgNVBAYT
AlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xJDAi
BgNVBAMTG0RpZ2lDZXJ0IEFzc3VyZWQgSUQgUm9vdCBHMjAeFw0yNDAzMTMwMDAwMDBaFw0zNDAz
MTIyMzU5NTlaMGIxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjE6MDgGA1UE
AxMxRGlnaUNlcnQgQXNzdXJlZCBHMiBTTUlNRSBSU0E0MDk2IFNIQTM4NCAyMDI0IENBMTCCAiIw
DQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAOfSIeC0vv1xPQ+dgSxbIIrkaru6skAWJYaGFzmv
q4Kq+2wU2jxhcWlJg/JeP5jEkq/LM3pn5aaLao79j+XRmS7J1ZpJKUODJVoM4s9MQJhTMvo4qS5Z
S64g6QR7Obkz3I1Lr3aWeSBmDDEyzue+NKtuWZ1Cxy3RdXo/w5HgRc3l2AercOM3Gt1XonTzEtTb
Z/Hwc0Sn9Gz8RmGRK6Ka4hVDl8q/2l110KaV233Kh5etP0csXS8MIMdVRfRu3sc5hp13DG7lCKzK
72a2GEpI8Wpl26G6I1/LMzz/98T+FqjTqxsdquk7Cj7m2vKGLW1BorpQH7WFGPdJQXJe1hfbfiZA
CcVdCtl4nAacFacmsiArZBfX7AQGL7isvHUwwYFEtcApyGW4p2Lt+t8nvU0CANA6BHOpOz1xOP8W
mAESbUriIjyuTUf3fJ9oDNCurVqhASMJCDaWI3lYX/QAoiAzt6akqbbZxo2ujW7mGGqc0KxqE2cs
h2T79v7pC8aUtHBfwNrTR19GnZVxE0eQ7ViIQhR6mpSaUQFA9sG+cmD2G8TnCgYsLa0q8De6F61a
CBevQGHNzrbZ3JAMneveYg/Jy1XxQHDRcvrMfWKe0jjcWbdKYlaGVPm5V1ILwYz7Yv5ewo3NUrxI
GJiywe9qPhuJSDZs7VehTuI0FxGIsgKzVjgbAgMBAAGjggFcMIIBWDASBgNVHRMBAf8ECDAGAQH/
AgEAMB0GA1UdDgQWBBT3m6JO05fF9DQPQw6Bhc6RkzKv+TAfBgNVHSMEGDAWgBTOw0q5mVXyuNtg
v6l+vVa1lzan1jAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMC
MHkGCCsGAQUFBwEBBG0wazAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29tMEMG
CCsGAQUFBzAChjdodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRBc3N1cmVkSURS
b290RzIuY3J0MEUGA1UdHwQ+MDwwOqA4oDaGNGh0dHA6Ly9jcmwzLmRpZ2ljZXJ0LmNvbS9EaWdp
Q2VydEFzc3VyZWRJRFJvb3RHMi5jcmwwEQYDVR0gBAowCDAGBgRVHSAAMA0GCSqGSIb3DQEBDAUA
A4IBAQA+b8Uw53sDspdZgukU+qzLyyHkcjlxGGhHlP+zrmDLKm1wEFvCRS2pili3Hy67i8N4N5NU
vw5Rg6kv3lxb9S9Rktxk43k+tvm68pl7OxQE55ZjVY87P0lUPGwEqOOwLLyH02ZQcsfq5p5LrOH9
0JvmvZ1yy73HS+VpDAqOlytE0NSvTIRqFFkKQGQwfjvtql9YflujuNNvJztjBaHKYZsnNSg+J38o
jYq4TP3pSg3UdVH0PncVjPQyqxC9xef5Xae92Kbkzol3x7Nel3A1bwAkalrDMspvTHvey6LfiBks
FIqviTnoy7fgjaRAJgHS+RXx/cmuRd3rUAclSVVrYu8RMIIHAzCCBOugAwIBAgIQAzUotrsybJHx
HTjKOIVdIDANBgkqhkiG9w0BAQsFADBiMQswCQYDVQQGEwJVUzEXMBUGA1UEChMORGlnaUNlcnQs
IEluYy4xOjA4BgNVBAMTMURpZ2lDZXJ0IEFzc3VyZWQgRzIgU01JTUUgUlNBNDA5NiBTSEEzODQg
MjAyNCBDQTEwHhcNMjYwNzE4MDAwMDAwWhcNMjgwMTA0MjM1OTU5WjAeMRwwGgYDVQQDDBNkd213
MkBpbmZyYWRlYWQub3JnMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA2pYux73kdbYX
sWF8f1u6DJP91qcqaZetsyfPkZk0B+MmXmAEv0kVes5n15V2mbDThOnpoPFly0UugQO9JYqLfrtD
tKD5yL58fgrDB9Dw+LQikgrHafl6YSCds5AvUu/8hw2J6noKrcOLJpKlKn9Fl/4IB9Q3JIdLx5aa
EtTqMalIPqHFOlgrJ7s+aua8xbB8YQ9ahqYBXWRJNv3P/2b1DYtdrz1oqZPE3CcB8Pc6Gf2a1Tcm
6TAgtEx7Cf1BFcrsrMz7TWHmGQITieNb2r9UYWSc2Gp+GtYFNJCgT0JJXKUBIauPMKBLteYrL8Fo
ff/uY44dC/mDWjdCP/5x0qelPQjlBvWdHL5zvBTOj06rJ0m3HNI/hnIcDh0Qu2j9reb9rLVcdym6
bWmBM4uDEB8Zv9Ph0KTBFSy1IosyakuD1j1Os30EzjGfbi0EUXIvnOcYbTBAbM5UAzrxEHMhBvoX
Pvnx+OyvjJmc9tWxTX6AcSz+m40esbT17URBeZS18afgieiikm5TynlUYP1LciR3hSgGVzvGXnKO
02VDFR5itGWdRKZ2W5wIShNfWfhSa0D0K5UdIDt5Qc7sjzwK1Yb1sY5Tu0uA5mhIS82q1ov83uxB
sFkriNnhGv/M1NCDVLBiOMsHu73qUM+yKmgKLwF9Hfn9WI25glbAMI4S5r3hYzcCAwEAAaOCAfcw
ggHzMB8GA1UdIwQYMBaAFPebok7Tl8X0NA9DDoGFzpGTMq/5MB0GA1UdDgQWBBRcYhqbcGzn1jrT
JOZaB8O7qllDpzAwBgNVHREEKTAngRNkd213MkBpbmZyYWRlYWQub3JngRBkYXZpZEB3b29kaG91
LnNlMBQGA1UdIAQNMAswCQYHZ4EMAQUBAjAOBgNVHQ8BAf8EBAMCBeAwHQYDVR0lBBYwFAYIKwYB
BQUHAwIGCCsGAQUFBwMEMIGpBgNVHR8EgaEwgZ4wTaBLoEmGR2h0dHA6Ly9jcmwzLmRpZ2ljZXJ0
LmNvbS9EaWdpQ2VydEFzc3VyZWRHMlNNSU1FUlNBNDA5NlNIQTM4NDIwMjRDQTEuY3JsME2gS6BJ
hkdodHRwOi8vY3JsNC5kaWdpY2VydC5jb20vRGlnaUNlcnRBc3N1cmVkRzJTTUlNRVJTQTQwOTZT
SEEzODQyMDI0Q0ExLmNybDCBjQYIKwYBBQUHAQEEgYAwfjAkBggrBgEFBQcwAYYYaHR0cDovL29j
c3AuZGlnaWNlcnQuY29tMFYGCCsGAQUFBzAChkpodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20v
RGlnaUNlcnRBc3N1cmVkRzJTTUlNRVJTQTQwOTZTSEEzODQyMDI0Q0ExLmNydDANBgkqhkiG9w0B
AQsFAAOCAgEAocabrh1cPd5s3vY5rnlBVQSTc7zs2ZWs67dAIltR+05WELrYClVzzUhMs/LOJPlr
EUo45UDDomXq38DxFepaPd9+iNLjXfn33EX/IG44j04lU/oF/Rg9VeQILkYLbCZ/x9wOjNHZc4SN
ydY7Dhvf/sT5aBz88u7D5+azZJ7Qf1U57wYseCH1Mt0nDrtr5y19IJ8D9xJJ33RFL6vfpHZBBAQ8
+3RqkKNxLoV2aFvQhxdhjNLDqTv3LjUIdicwPraN7JkxEu7CV2Lka7eRqJgkWL7SK0YmBjGpRafs
+icP/ON5RCCKTTb6VlX8eTG2sJJfsFhvJNCCt6xexbWzWtIrfP7NvPBvwBB737AyEGBZkS5aNizT
McURJGTv9UKvBh1LF/+tNhYtLvPCN7oecGzhCHht9jcwSkygTo3Y6YlK3QgOu+ncmiBbfeuwlLZ1
LxbYvG6hgNqXv7u6YyADbYajAQJXJ2OQen39pm3Q/AQSyLYG+B8lDglWsM8tYXPlEdrYJcksGK6F
nqIX6Bumn43rBooLJdiZp4WmfWdL2pxe+LxRDjprmqu1WprixDxULSTOKJZoqTlugs6y3Bc+if+s
gHnBBtz9WQ6MtPHkh7zONDAFIKcBmv8OqPQCx0F3Wv3OEybwMpXx0OsKgK8wLldaX1pXcMuyDgTL
Sqs0AV0OHUgwggcDMIIE66ADAgECAhADNSi2uzJskfEdOMo4hV0gMA0GCSqGSIb3DQEBCwUAMGIx
CzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjE6MDgGA1UEAxMxRGlnaUNlcnQg
QXNzdXJlZCBHMiBTTUlNRSBSU0E0MDk2IFNIQTM4NCAyMDI0IENBMTAeFw0yNjA3MTgwMDAwMDBa
Fw0yODAxMDQyMzU5NTlaMB4xHDAaBgNVBAMME2R3bXcyQGluZnJhZGVhZC5vcmcwggIiMA0GCSqG
SIb3DQEBAQUAA4ICDwAwggIKAoICAQDali7HveR1thexYXx/W7oMk/3Wpyppl62zJ8+RmTQH4yZe
YAS/SRV6zmfXlXaZsNOE6emg8WXLRS6BA70liot+u0O0oPnIvnx+CsMH0PD4tCKSCsdp+XphIJ2z
kC9S7/yHDYnqegqtw4smkqUqf0WX/ggH1Dckh0vHlpoS1OoxqUg+ocU6WCsnuz5q5rzFsHxhD1qG
pgFdZEk2/c//ZvUNi12vPWipk8TcJwHw9zoZ/ZrVNybpMCC0THsJ/UEVyuyszPtNYeYZAhOJ41va
v1RhZJzYan4a1gU0kKBPQklcpQEhq48woEu15isvwWh9/+5jjh0L+YNaN0I//nHSp6U9COUG9Z0c
vnO8FM6PTqsnSbcc0j+GchwOHRC7aP2t5v2stVx3KbptaYEzi4MQHxm/0+HQpMEVLLUiizJqS4PW
PU6zfQTOMZ9uLQRRci+c5xhtMEBszlQDOvEQcyEG+hc++fH47K+MmZz21bFNfoBxLP6bjR6xtPXt
REF5lLXxp+CJ6KKSblPKeVRg/UtyJHeFKAZXO8Zeco7TZUMVHmK0ZZ1EpnZbnAhKE19Z+FJrQPQr
lR0gO3lBzuyPPArVhvWxjlO7S4DmaEhLzarWi/ze7EGwWSuI2eEa/8zU0INUsGI4ywe7vepQz7Iq
aAovAX0d+f1YjbmCVsAwjhLmveFjNwIDAQABo4IB9zCCAfMwHwYDVR0jBBgwFoAU95uiTtOXxfQ0
D0MOgYXOkZMyr/kwHQYDVR0OBBYEFFxiGptwbOfWOtMk5loHw7uqWUOnMDAGA1UdEQQpMCeBE2R3
bXcyQGluZnJhZGVhZC5vcmeBEGRhdmlkQHdvb2Rob3Uuc2UwFAYDVR0gBA0wCzAJBgdngQwBBQEC
MA4GA1UdDwEB/wQEAwIF4DAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwgakGA1UdHwSB
oTCBnjBNoEugSYZHaHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0QXNzdXJlZEcyU01J
TUVSU0E0MDk2U0hBMzg0MjAyNENBMS5jcmwwTaBLoEmGR2h0dHA6Ly9jcmw0LmRpZ2ljZXJ0LmNv
bS9EaWdpQ2VydEFzc3VyZWRHMlNNSU1FUlNBNDA5NlNIQTM4NDIwMjRDQTEuY3JsMIGNBggrBgEF
BQcBAQSBgDB+MCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wVgYIKwYBBQUH
MAKGSmh0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRHMlNNSU1FUlNB
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
KOHziI77lVKsU8TZEGh9DgcAAAAAAAA=


--=-omMEqip56wa1pnHtqwLW--
