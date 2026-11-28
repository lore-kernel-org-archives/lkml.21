Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795872121;
	b=fDNBVAOUtk2zKOcDL93bPtcQotLoT0vpRMozLmCe60DenrxEaBfT51PBHQmrY4o7YQkP
	 /uciWz47lozvpArWCuvnkVbhrYbouTAhzNdKzxELXPv7/SKWCmtB8BLpY0ZpHbgs3jVfU
	 wr727+7ttPeycThMz5vjXVOnFcPwnWKxfEDzxw1a7Q3WFirYRpwDo45JnlYUjyJj4YxBb
	 Z67Tnj/atYEOLhb2w6XSjp4fQVGKtkxkWBRLNcpp38Uju7CYLWGz97WX7plGePOf7EZjs
	 HBBuxNYBBJgjXckcWbNNmie9COtcFCN5tjxjleyptdQsGr4gwzSP8bY9yeT9tboN8HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795872121;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=OKchwvKFFyVA10PGK0/CuKbeauKY6vU69q+f+1larGQ=;
	b=ZdCPxS8WzfVGyUIImhUw8SbxoMCcJOXH6Hu01G1TJ8SNKXh1p2TA7IlKrWInD495ShDT
	 efvxLzK6523RHgC5gGDsxobiLOBS+4Qzz7jdWhal2977/WUCXtWsQcjpcizG8/BJ1TOhJ
	 3YIX69zLTDM+BvnYnJlF91qfDWGz1pDMu5Ei2bqUUSBOhKLMlRI8uWStJ5PpcWMP/ySUl
	 JQRMi/LSCzY6Q9Ptiz4SU/QegTxjPjcC44cW9xYvX+1Vw88QyNB8jhVh2IsCTXEVC1i4v
	 qNWSmgCmK6RKyDh8WVZniZQJLwtcJ4UYIJ3nkZwd38Tgx0InsnLYHK5o6pby8tPgJNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=Ezd2Tvbi;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F92E606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 13:22:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F92E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=Ezd2Tvbi
DKIM2-Signature:  i=1; m=1; t=1795872118;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.de;
 s=s31663417:rsa-sha256:Yhi2unbUxFL3IWyicHXF0slMqgFL
   MnCUeuV4Xkym+MqBMQZmT8vwYhb/8MW/J+L0pxIltRHKgjqlmqjFi726wopOneR+Mx6i7/g+NQO
   9VoQDPcWFgehIgWGqc9qcd2HMRtQ2rrRj7TQ9Wavhz4k6bNpCzfAHeRsHyDombOsCn5218StieF
   qVwaRQTYBeG7O447kiMW+WoUKAGtMOty0hPUy0nj4cHz3HaL8PKiYPuQLN6ZKtLvEEUDpafVGcj
   U3x4iMaha2xxpuwwz5rGtn0gvXIue+gixdEGEB8oTsTjtPost7k6zcEccuZh3XTmNHByDtZb+Ej
   q7w7zu4N44FYiw==;
Message-Instance:  m=1;
 h=sha256:
   jge4A3tzd97lMCPZYH/JfrXitsq/s7fciXb+jvNA6qc=:
   /hqBPbUan2efu+xui6UUB6GyixPitKjKlH5qw0ddC8I=,
  sha512:
   bxNQQDCpptwSuwZV77+jlLhRVQ4pxOq2+baEtDbjqB3diWLG+2YIvKMQbUNTR5oucIEqf/kxD7isgQ2RUhJfKA==:
   XJvDyWrDCzj4DndwXT+bdNhDKLmp6YWs4+qjur5XPjxvO/3WYBxiyKNNaQPzJfMTFFCiz55Jvs46uuYcQXJnAg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795872118; x=1796476918; i=w_armin@gmx.de;
	bh=OKchwvKFFyVA10PGK0/CuKbeauKY6vU69q+f+1larGQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Ezd2TvbiNMRA0UT8Z1x1z0fN9V0WX0uqP9Nje2FH4agUf953qlmMYdm99RQqDmhm
	 pVCc0S7/MPb5iVhLLTmQWo34SeP12VVnNiNqDAPkZOIzEzv24tiVAWhs1mmsVeYUn
	 OJWiW+08joj8PYiLjl2LHGnFZDeTtNcu49lNygzbVcSeZ0ayfEUFSGdn1wXdeO3Yc
	 /l1hpVxKNVlAwISOAocvdl2tw/kg1GSLh1oNNEOLIOg0dsveo44mKKKUYU7EIeAeB
	 muFcLoNgdpx6h1nwKa0dGQX/vFKpI/s+Hh/iv+Zg8279ahhqBc1gQzzE9lcISP9bl
	 BdRIgRxjWlhkIGPeVw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MoO6C-1yHNgk1XTs-00gkGc; Sat, 28
 Nov 2026 14:21:58 +0100
Message-ID: <bf3fdfc5-7345-4271-8098-b9cd00154abb@gmx.de>
Date: Sat, 28 Nov 2026 14:21:57 +0100
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
Subject: Re: [PATCH v3 11/11] leds: multicolor: Adjust maximum subled
 intensity during initialization
To: Lee Jones <lee@kernel.org>
Cc: pavel@kernel.org, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org, i@rong.moe
References: <20261120212431.152081-1-W_Armin@gmx.de>
 <20261120212431.152081-12-W_Armin@gmx.de>
 <179568582896.32537.166831565181132392@kernel.org>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <179568582896.32537.166831565181132392@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5o5vd4uYx4qpDOC29jaW2r9mjgGorIS8OPdbeCGANoZo/1nH9Tc
 UdAfWZI0rs8jhOCQ3oq+Ez2UbVxih38mzW5lea7y6iSmGdUAJC7ouzCo3++yv1SlUBEV7of
 8j6lN7US27Um6GS9TRXGlfCYkzsl/lXe7L5gvx+6CtYDnNCHu4OlYCa+CDYStRD7r9TlPPS
 kIEr8tqWU5SWgZ4D4DQDg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ugSaBgY6Xqk=;T84g7JX/ThsD2of9Km8Usu8rgZW
 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
 TCyLLcgANm7MVnhec0rf7F/7iBOOtJQ=

Am 27.11.26 um 15:37 schrieb Lee Jones:

> --- checkpatch.pl (1 issue) ---
> Line 77: ERROR: that open brace { should be on the previous line
> ----------------------------------
>
> On Fri, 20 Nov 2026, Armin Wolf wrote:
>
>> The maximum brightness of a LED device is fixed after having called
>> led_classdev_init(), so performing the adjustment during runtime is
>> no longer necessary.
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   drivers/leds/led-class-multicolor.c | 40 ++++++++++++----------------=
-
>>   1 file changed, 16 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-cla=
ss-multicolor.c
>> index 0656ca2361b3..09c52bc1a55a 100644
>> --- a/drivers/leds/led-class-multicolor.c
>> +++ b/drivers/leds/led-class-multicolor.c
>> @@ -14,24 +14,6 @@
>>   #include <linux/uaccess.h>
>>   #include "leds.h"
>>
>> -static unsigned int led_mc_get_max_intensity(struct led_classdev_mc *m=
cled_cdev, size_t index)
>> -{
>> -	unsigned int max_intensity;
>> -
>> -	/*
>> -	 * The maximum global brightness value might still be changed by
>> -	 * led_classdev_register_ext() using devicetree properties. This
>> -	 * prevents us from changing subled_info[X].max_intensity when
>> -	 * registering a multicolor LED class device, so we have to do
>> -	 * this during runtime.
>> -	 */
>> -	max_intensity =3D mcled_cdev->subled_info[index].max_intensity;
>> -	if (max_intensity)
>> -		return max_intensity;
>> -
>> -	return mcled_cdev->led_cdev.max_brightness;
>> -}
>> -
>>   int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
>>   				 enum led_brightness brightness)
>>   {
>> @@ -53,12 +35,10 @@ static ssize_t multi_max_intensity_show(struct devi=
ce *dev,
>>   {
>>   	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
>>   	struct led_classdev_mc *mcled_cdev =3D lcdev_to_mccdev(led_cdev);
>> -	unsigned int max_intensity;
>>   	int len =3D 0;
>>
>> -	for (int i =3D 0; i < mcled_cdev->num_colors; i++) {
>> -		max_intensity =3D led_mc_get_max_intensity(mcled_cdev, i);
>> -		len +=3D sysfs_emit_at(buf, len, "%u", max_intensity);
>> +	for (unsigned int i =3D 0; i < mcled_cdev->num_colors; i++) {
> How many colours are you expecting?
>
> It's usual (although not unheard of) to use unsigned for this.

I decided to use unsigned int because num_colors itself is unsigned, so
IMHO having matching types is better here.

>> +		len +=3D sysfs_emit_at(buf, len, "%u", mcled_cdev->subled_info[i].ma=
x_intensity);
>>   		if (i < mcled_cdev->num_colors - 1)
>>   			len +=3D sprintf(buf + len, " ");
>>   	}
>> @@ -98,8 +78,8 @@ static ssize_t multi_intensity_store(struct device *d=
ev,
>>   		goto err_out;
>>   	}
>>
>> -	for (int i =3D 0; i < mcled_cdev->num_colors; i++) {
>> -		max_intensity =3D led_mc_get_max_intensity(mcled_cdev, i);
>> +	for (unsigned int i =3D 0; i < mcled_cdev->num_colors; i++) {
>> +		max_intensity =3D mcled_cdev->subled_info[i].max_intensity;
>>   		mcled_cdev->subled_info[i].intensity =3D min(intensity_value[i], ma=
x_intensity);
>>   	}
>>
>> @@ -187,6 +167,18 @@ int led_classdev_multicolor_register_ext(struct de=
vice *parent,
>>   	if (ret < 0)
>>   		return ret;
>>
>> +	/*
>> +	 * The maximum global brightness value might have been changed by
>> +	 * led_classdev_init() using devicetree properties. Because of this
>> +	 * we can only adjust subled_info[X].max_intensity after said functio=
n
>> +	 * was called.
>> +	 */
>> +	for (unsigned int i =3D 0; i < mcled_cdev->num_colors; i++)
>> +	{
> Nit: Misplaced '{'.

Good catch, it seems i forgot to install by post-commit hook for running c=
heckpatch xd.

Thanks,
Armin Wolf

>> +		if (!mcled_cdev->subled_info[i].max_intensity)
>> +			mcled_cdev->subled_info[i].max_intensity =3D led_cdev->max_brightne=
ss;
>> +	}
>> +
>>   	led_cdev->dev->type =3D &led_multicolor_device_type;
>>
>>   	return led_classdev_add(led_cdev, init_data);
>> --=20
>> 2.56.1
>>
>>
